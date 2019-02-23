extends KinematicBody2D

const SPEED = 700
var velocity = Vector2()

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	pass

func get_input():
	velocity = Vector2()
	
	velocity.y -= 1
	
	if global_position.y < -30:
		queue_free()
		pass

	velocity = velocity.normalized() * SPEED
	pass