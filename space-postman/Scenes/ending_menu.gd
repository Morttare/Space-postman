extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		Global.reset_game()
		get_tree().change_scene_to_file.call_deferred("res://Scenes/Mainmenu.tscn")
