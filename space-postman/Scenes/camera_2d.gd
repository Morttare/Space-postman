extends Camera2D

@onready var player = get_node("/root/KnittedPlanet/Postman")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


var camera_speed = 1 # decrease for delayed camera
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = lerp(position.x, player.position.x, camera_speed)
	position.y = player.position.y
