extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var walk_speed = 400
const TILE_SIZE = 16

var initial_position = Vector2(0,0)
var is_moving = false


func _ready():
	initial_position = position

func _physics_process(delta: float) -> void:
	if is_moving == false:
		process_player_input()
		move_and_slide()
	else:
		is_moving = false

func process_player_input():
	var direction_horizontal := Input.get_axis("move_left", "move_right")
	var direction_vertical := Input.get_axis("move_up", "move_down")
		
	if direction_horizontal:
		velocity.x = direction_horizontal * walk_speed
	
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed)
		
	if direction_vertical:
		velocity.y = direction_vertical * walk_speed
		
	else:
		velocity.y = move_toward(velocity.y, 0, walk_speed)
