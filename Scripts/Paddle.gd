extends KinematicBody2D

const ball_scene = preload("res://Scenes/Ball.tscn")

func _ready():
	set_process_input(true)


func _input(event):
	var posx = position.x
	var posy = position.y
	
	if event is InputEventMouseButton:
			if event.is_pressed():
				var ball = ball_scene.instance()
				ball.set_position(position-Vector2(0,0))
				get_tree().root.add_child(ball)
				
	elif event is InputEventKey:
		match event.scancode:
			KEY_W:
				posy -= 5
			KEY_S:
				posy += 5
			KEY_A:
				posx -= 5
			KEY_D:
				posx += 5
				
		set_position(Vector2(posx, posy))
