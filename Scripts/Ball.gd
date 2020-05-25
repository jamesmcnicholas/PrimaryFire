extends RigidBody2D

export var speedup = 10
const MAXSPEED = 500

func _ready():
	set_physics_process(true)
	var speed = get_linear_velocity().length()
	var direction = get_viewport().get_mouse_position() - position
	var velocity = direction.normalized() * min(speed + speedup, MAXSPEED)
	set_linear_velocity(velocity)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	
	for body in bodies:	
		if body.is_in_group("Bricks"):
			get_node("/root/World").score +=5
			body.queue_free()
			queue_free()

	if position.y > get_viewport_rect().end.y:
		queue_free()
