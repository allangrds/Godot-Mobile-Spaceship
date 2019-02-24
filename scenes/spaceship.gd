extends KinematicBody2D

const SPEED = 200
const INTERVAL = .3
var velocity = Vector2()
var shoot_model = preload("res://scenes/Shoot.tscn")
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
			var cannon_left_position = get_node("Position_cannon_left")
			var cannon_right_position = get_node("Position_cannon_right")
			
			shoot_insert(cannon_left_position)
			shoot_insert(cannon_right_position)

			last_shoot = INTERVAL
			pass
		pass
	
	if last_shoot > 0:
		last_shoot -= delta
		pass
	pass

func shoot_insert(cannon_position):
	var shoot = shoot_model.instance()
	
	shoot.position = Vector2(
		cannon_position.global_position.x,
		cannon_position.global_position.y
	)
	owner.add_child(shoot)