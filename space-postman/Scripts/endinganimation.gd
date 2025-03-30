extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed_scale = 0.6
	play("flying ship")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
