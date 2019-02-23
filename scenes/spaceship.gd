extends KinematicBody2D

const SPEED = 200
var velocity = Vector2()

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	pass

func get_input():
	velocity = Vector2()

	if Input.is_action_pressed('ui_right'):
		if global_position.x > (640 - 50):
			velocity.x = 0
		else:
			velocity.x += 1

	if Input.is_action_pressed('ui_left'):
		if global_position.x < 50:
			velocity.x = 0
		else:
			velocity.x -= 1

	velocity = velocity.normalized() * SPEED