extends Control

# For the space ship launch animation
@onready var pathfollow : PathFollow2D = $Path2D/PathFollow2D

# Because some fools smash space again and again
@onready var justonce = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		$MenuMusic.stop()
		pathfollow.progress_ratio = 1
		if justonce == 0:
			$"MenuMusic/SFX StartGame".play()
			justonce += 1
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file.call_deferred("res://Scenes/knitted_planet.tscn")
