extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.stream = load("res://Audio/Music and sounds/SP Prelude to knitted planet.wav")
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_finished() -> void:
	self.stream = load("res://Audio/Music and sounds/SP Knitted Planet v1.wav")
	self.autoplay = true
	self.play()
