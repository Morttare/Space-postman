extends Area2D

var is_met = false

@export var auto_solve = false
@onready var postman = get_node("/root/KnittedPlanet/Postman")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if auto_solve:
		is_met = true
		Global.letters.append("retirement_form")
		Global.is_grandma_solved = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.timeline_ended.connect(_on_timeline_end)
				if not is_met:
					is_met = true
					Dialogic.signal_event.connect(_on_dialogic_signal)
					Dialogic.start("grandma_meet")
				else:
					if Global.is_grandma_solved:
						Dialogic.start("grandma_generic")
					elif len(Global.letters) == 4:
						Global.is_grandma_solved = true
						Global.letters.clear()
						Global.letters.append("retirement_form")
						Dialogic.start("grandma_letters_found")
					else:
						Dialogic.start("grandma_puzzle_in_progress")

func _on_dialogic_signal(argument : String):
	if argument == "rip":
		$"../Path2D/PathFollow2D/Piece1".visible = true
		$"../Path2D/PathFollow2D/Piece2".visible = true
		$"../Path2D/PathFollow2D/Piece3".visible = true
		$"../Path2D/PathFollow2D/Piece4".visible = true
		$"../AnimationPlayer".play("lettersflying")


func _on_timeline_end():
	Dialogic.timeline_ended.disconnect(_on_timeline_end)
	$Label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		if not Global.is_grandma_solved:
			$Label.visible = true



func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "lettersflying":
		$"../Path2D/PathFollow2D/Piece1".visible = false
		$"../Path2D/PathFollow2D/Piece2".visible = false
		$"../Path2D/PathFollow2D/Piece3".visible = false
		$"../Path2D/PathFollow2D/Piece4".visible = false
