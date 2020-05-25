extends KinematicBody2D

const ball_scene = preload("res://Scenes/Ball.tscn")

func _ready():
	set_process_input(true)


func _input(event):
	if event is InputEventMouseButton:
			if event.is_pressed():
				var ball = ball_scene.instance()
				ball.set_position(position-Vector2(0,0))
				get_tree().root.add_child(ball)
				
