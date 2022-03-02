extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 50
const GRAVITY = 30
const JUMP = -900

func _physics_process(delta):
#	velocity = Vector2()
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP
#	velocity = velocity.normalized() * speed

	velocity = move_and_slide(velocity)
