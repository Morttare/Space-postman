extends Node2D

@onready var UI = get_node("/root/KelaPlanet/CanvasLayer/UI")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.letters.append("retirement_form")
	UI.update_letters()
	UI.visible = true
	Global.current_planet = 1
	#RenderingServer.set_default_clear_color("70899e") #Light wall colour
	#RenderingServer.set_default_clear_color("324558") #Dark wall colour
	#RenderingServer.set_default_clear_color("313131") #Grey
	RenderingServer.set_default_clear_color("1e1f22") #Dark grey
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
