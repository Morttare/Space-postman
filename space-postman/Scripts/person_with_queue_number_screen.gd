extends Area2D

@export var is_correct_queue = false
@export var modulo : int
@export var number_change_time : float = 1.0

@onready var postman = get_node("/root/KelaPlanet/Postman")
@onready var number_label = $"Number screen/Label"
@onready var talk_label = $Label
@onready var timer = $Timer
@onready var tensdigit = $"Number screen/DigitTens"
@onready var unitsdigit = $"Number screen/DigitUnits"

@onready var success_sound = get_node("/root/KelaPlanet/Postman/KelaMusic/LetterDeliverySuccess")
@onready var fail_sound = get_node("/root/KelaPlanet/Postman/KelaMusic/LetterDeliveryFail")

var max_number = 100


func _ready() -> void:
	timer.wait_time = number_change_time
	talk_label.visible = false
	update_screen(0)
	
func _on_timer_timeout() -> void:
	var new_number = floor((randi() % max_number)/modulo)*modulo
	if new_number == 0 or new_number == Global.queue_number:
		new_number += modulo
	update_screen(new_number)

func update_screen(number : int):
	#	number_label.text = str(new_number)
	var tens = floor(number/10)
	var units = number - tens*10
	# first i.e. 0th frame is 1, last i.e. 9th frame is 0
	if tens == 0:
		tensdigit.frame = 9
	else:
		tensdigit.frame = tens-1
	if units == 0:
		unitsdigit.frame = 9
	else:
		unitsdigit.frame = units-1



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if talk_label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.VAR.has_letter = "retirement_form" in Global.letters
				print(Dialogic.VAR.has_letter)
				#Dialogic.signal_event.connect(_on_dialogic_signal)
				Dialogic.timeline_ended.connect(_on_timeline_ended)
				if is_correct_queue:
					Dialogic.start("correct_queue")
				else:
					Dialogic.start("wrong_queue")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	#Dialogic.signal_event.disconnect(_on_dialogic_signal)
	talk_label.visible = false
	print("rueoihgrg")

#func _on_dialogic_signal(argument : String):
	#if argument == "gave_letter":
		#if is_correct_queue and talk_label.visible and Global.queue_number != 0:
			#Global.letters.clear() # erase didn't work; clear() will cause problems with two letter
			#success_sound.play()
			#Global.is_kela_solved = true
			#print("Jippi jei!")
			#Dialogic.start("correct_queue")
		#else:
			#fail_sound.play()
			#print("ähäkutti!")
			#Dialogic.start("wrong_queue")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = false
