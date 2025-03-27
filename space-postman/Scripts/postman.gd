extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var walk_speed = 400
const TILE_SIZE = 16

var initial_position = Vector2(0,0)
var is_moving = false
var direction = 3

var letters = []

func _ready():
	initial_position = position

func _physics_process(_delta: float) -> void:
	if is_moving == false and Dialogic.current_timeline == null:
		process_player_input()
		move_and_slide()
	else:
		is_moving = false

func process_player_input():
	var direction_horizontal := Input.get_axis("move_left", "move_right")
	var direction_vertical := Input.get_axis("move_up", "move_down")
	handle_animations(direction_horizontal, direction_vertical)
		
		
	if direction_horizontal and direction_vertical:
		velocity.x = direction_horizontal * walk_speed * 0.7
		velocity.y = direction_vertical * walk_speed * 0.7
		
	else:
		if direction_horizontal:
			velocity.x = direction_horizontal * walk_speed
		
		else:
			velocity.x = move_toward(velocity.x, 0, walk_speed)
			
		if direction_vertical:
			velocity.y = direction_vertical * walk_speed
			
		else:
			velocity.y = move_toward(velocity.y, 0, walk_speed)
	

func handle_animations(direction_horizontal, direction_vertical):
	if direction_horizontal > 0.0:
		direction = 3
		$AnimatedSprite2D.play("walk_right")
	elif direction_horizontal < 0.0:
		direction = 9
		$AnimatedSprite2D.play("walk_left")
	elif direction_vertical < 0.0:
		direction = 12
		$AnimatedSprite2D.play("walk_up")
	elif direction_vertical > 0.0:
		direction = 6
		$AnimatedSprite2D.play("walk_down")
	else:
		if direction == 3:
			$AnimatedSprite2D.play("right")
		elif direction == 9:
			$AnimatedSprite2D.play("left")
		elif direction == 12:
			$AnimatedSprite2D.play("up")
		elif direction == 6:
			$AnimatedSprite2D.play("down")
		else:
			$AnimatedSprite2D.play("idle")
		
		
		
		
		
		
