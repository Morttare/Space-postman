extends Area2D

@onready var postman = get_node("/root/KnittedPlanet/Postman")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Label.visible:
		if Input.is_action_just_pressed("interact"):
			if Global.is_grandma_solved and Global.current_planet == 0:
				get_tree().change_scene_to_file("res://Scenes/kela_planet.tscn")


func _on_body_entered(body: Node2D) -> void:
	if Global.is_grandma_solved:
		if body.name == "Postman":
			$Label.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
