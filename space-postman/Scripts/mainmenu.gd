extends Control


# Because some fools smash space again and again
@onready var is_pressed = false
# Because other fools are too impatient to wait
@export var skip_animation = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if not skip_animation:
			$MenuMusic.stop()
			$AnimationPlayer.play("spaceshipmove")
			if not is_pressed:
				$"MenuMusic/SFX StartGame".play()
				is_pressed = true
			await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file.call_deferred("res://Scenes/knitted_planet.tscn")
