extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Label.visible:
		if Input.is_action_just_pressed("interact"):
			if Global.is_grandma_solved and Global.current_planet == 0:
				self.visible = false
				$"../Postman".visible = false
				$"../Path2D2".visible = true
				$"../PlanetMusic".stop()
				$"../PlanetMusic/Spaceshiptakeoff".play()
				$"../AnimationPlayer".speed_scale = 1
				$"../AnimationPlayer".play("planetexitanimation")
				
				$"../Timer".start()
			elif Global.is_kela_solved and Global.current_planet == 1:
				get_tree().change_scene_to_file("res://Scenes/ending.tscn")


func _on_body_entered(body: Node2D) -> void:
	if Global.is_grandma_solved and Global.current_planet == 0 or Global.is_kela_solved and Global.current_planet == 1:
		if body.name == "Postman":
			$Label.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Postman":
		$Label.visible = false


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/kela_planet.tscn")
