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
	if new_number == 0 or (new_number == Global.queue_number and not is_correct_queue):
		new_number += modulo
	update_screen(new_number)

func update_screen(number : int):
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
				talk_label.visible = false
				Dialogic.VAR.has_letter = "retirement_form" in Global.letters
				Dialogic.timeline_ended.connect(_on_timeline_ended)
				if not Global.is_kela_solved:
					if is_correct_queue:
						Global.is_kela_solved = true
						Dialogic.start("correct_queue")
					else:
						Dialogic.start("wrong_queue")
				else:
					Dialogic.start("go_away")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = false
