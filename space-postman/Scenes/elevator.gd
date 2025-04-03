extends Area2D

@export var target_x : float
@export var target_y : float

@onready var player = get_node("/root/KelaPlanet/Postman")
@onready var ding_sound = get_node("/root/KelaPlanet/Postman/KelaMusic/ElevatorDing")


func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			$Label.visible = false
			player.position = Vector2(target_x, target_y)
			ding_sound.play()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
