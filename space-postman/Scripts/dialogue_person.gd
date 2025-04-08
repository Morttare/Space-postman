extends Area2D

var is_met = false

@onready var UI = get_node("/root/KelaPlanet/CanvasLayer/UI")

@export var first_dialogue_timeline : String
@export var other_dialogue_timeline : String
@export var is_final_dialogue : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if $Label.visible:
			if Dialogic.current_timeline == null:
				Dialogic.signal_event.connect(_on_dialogic_signal)
				Dialogic.timeline_ended.connect(_on_timeline_ended)
				if not is_met:
					is_met = true
					Dialogic.start(first_dialogue_timeline)
				else:
					Dialogic.start(other_dialogue_timeline)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Dialogic.signal_event.disconnect(_on_dialogic_signal)
	$Label.visible = false
	if is_final_dialogue:
		get_tree().change_scene_to_file.call_deferred("res://Scenes/ending.tscn")

func _on_dialogic_signal(argument : String):
	if argument == "letter_given":
		UI.vagrant_letter()
	elif argument == "letters_delivered":
		UI.clean()
	elif argument == "new_letters":
		UI.final_boss()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false
