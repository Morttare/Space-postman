extends Area2D

var is_met = false

@export var auto_solve = false
@onready var postman = get_node("/root/KnittedPlanet/Postman")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if auto_solve:
		is_met = true
		postman.letters.append("retirement_form")
		Global.is_grandma_solved = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			if Dialogic.current_timeline == null:
				if not is_met:
					is_met = true
					Dialogic.start("grandma_meet")
				else:
					if Global.is_grandma_solved:
						Dialogic.start("grandma_generic")
					elif len(postman.letters) == 4:
						Global.is_grandma_solved = true
						postman.letters.append("retirement_form")
						Dialogic.start("grandma_letters_found")
					else:
						Dialogic.start("grandma_letters_not_found")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = true



func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
