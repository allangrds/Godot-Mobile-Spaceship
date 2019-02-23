extends KinematicBody2D

const SPEED = 200
var velocity = Vector2()
var shoot_model = preload("res://scenes/Shoot.tscn")
var interval = .3
var last_shoot = 0

func _physics_process(delta):
	get_input()
	shoot_prepare(delta)
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
	pass

func shoot_prepare(delta):
	if Input.is_action_pressed("shoot"):
		if last_shoot <= 0:
			var shoot = shoot_model.instance()
			shoot.position = Vector2(global_position.x, global_position.y)
			get_node("../").add_child(shoot)
			last_shoot = interval
			pass
		pass
	
	if last_shoot > 0:
		last_shoot -= delta
		pass
	pass