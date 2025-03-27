extends Area2D

var is_met = false

@onready var postman = get_node("/root/KnittedPlanet/Postman")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			if Dialogic.current_timeline == null:
				if not is_met:
					is_met = true
					Global.queue_number = 637
					Dialogic.start("receptionist_meet")
				else:
					Dialogic.start("receptionist_meet")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = true



func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
