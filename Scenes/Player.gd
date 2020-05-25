extends RigidBody2D

const ball_scene = preload("res://Scenes/Ball.tscn")
export var speedup = 10
const MAXSPEED = 500

func _ready():
	set_process_input(true)


func _input(event):
	if event is InputEventMouseButton:
			if event.is_pressed():
				var ball = ball_scene.instance()
				ball.set_position(position-Vector2(0,0))
				get_tree().root.add_child(ball)
				
	elif event is InputEventKey:
		var speed = get_linear_velocity().length()
		var direction = Vector2(0,0) - position
		match event.scancode:
			KEY_W:
				direction = Vector2(0,-1) * position
			KEY_S:
				direction = Vector2(0,1) * position
			KEY_A:
				direction = Vector2(-1,0) * position
			KEY_D:
				direction = Vector2(1,0) * position
				
		var velocity = direction.normalized() * min(speed + speedup, MAXSPEED)
		set_linear_velocity(velocity)
