extends Area2D

@export var letter_name : String
@onready var postman = get_node("/root/KnittedPlanet/Postman")
@onready var grandma = get_node("/root/KnittedPlanet/Grandma")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if grandma.is_met and not $Sprite2D.visible:
		$Sprite2D.visible = true
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			postman.letters.append(letter_name)
			free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman" and grandma.is_met:
		$Label.visible = true
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
