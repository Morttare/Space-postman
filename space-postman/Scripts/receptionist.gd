extends Area2D

var is_met = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.timeline_ended.connect(_on_timeline_ended)
				if not is_met:
					is_met = true
					Global.queue_number = 637
					Dialogic.start("receptionist_meet")
				else:
					Dialogic.start("receptionist_meet")

func _on_timeline_ended():
	$Label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
