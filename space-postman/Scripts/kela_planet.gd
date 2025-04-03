extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_planet = 1
	#RenderingServer.set_default_clear_color("70899e")
	RenderingServer.set_default_clear_color("324558")
	#RenderingServer.set_default_clear_color("313131")
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
