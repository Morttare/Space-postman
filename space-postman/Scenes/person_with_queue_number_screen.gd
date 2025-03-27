extends Area2D

@export var is_correct_queue = false
@export var modulo : int
@export var number_change_time : float = 1.0

@onready var postman = get_node("/root/KelaPlanet/Postman")
@onready var number_label = $"Number screen/Label"
@onready var talk_label = $Label
@onready var timer = $Timer


func _ready() -> void:
	timer.wait_time = number_change_time
	
func _on_timer_timeout() -> void:
	var new_number = floor((randi() % 1000)/modulo)*modulo
	if new_number == 0 or new_number == Global.queue_number:
		new_number += 1
	number_label.text = str(new_number)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if talk_label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.start("person_with_queue_number_screen")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		talk_label.visible = false
