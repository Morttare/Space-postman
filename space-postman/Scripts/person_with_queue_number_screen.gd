extends Area2D

@export var is_correct_queue = false
@export var modulo : int
@export var number_change_time : float = 1.0

@onready var postman = get_node("/root/KelaPlanet/Postman")
@onready var number_label = $"Number screen/Label"
@onready var talk_label = $Label
@onready var timer = $Timer

@onready var success_sound = get_node("/root/KelaPlanet/KelaMusic/LetterDeliverySuccess")
@onready var fail_sound = get_node("/root/KelaPlanet/KelaMusic/LetterDeliveryFail")


func _ready() -> void:
	timer.wait_time = number_change_time
	
func _on_timer_timeout() -> void:
	var new_number = floor((randi() % 1000)/modulo)*modulo
	if new_number == 0 or new_number == Global.queue_number:
		new_number += 1
	number_label.text = str(new_number)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if talk_label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.VAR.has_letter = "retirement_form" in Global.letters
				print(Dialogic.VAR.has_letter)
				Dialogic.signal_event.connect(_on_dialogic_signal)
				Dialogic.timeline_ended.connect(_on_timeline_ended)
				Dialogic.start("person_with_queue_number_screen")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.signal_event.disconnect(_on_dialogic_signal)
	talk_label.visible = false

func _on_dialogic_signal(argument : String):
	if argument == "gave_letter":
		if is_correct_queue and talk_label.visible and Global.queue_number != 0:
			Global.letters.clear() # erase didn't work; clear() will cause problems with two letter
			success_sound.play()
			Global.is_kela_solved = true
			print("Jippi jei!")
		else:
			fail_sound.play()
			print("ähäkutti!")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = false
