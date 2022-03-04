extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 20
const GRAVITY = 30
const JUMP = -700
onready var _animated_sprite = $AnimatedSprite

func _physics_process(delta):
	
	# Movement and animation 
	if Input.is_action_pressed("Right"):
		_animated_sprite.play("Walking")
		_animated_sprite.flip_h = false
		velocity.x += SPEED
	
	elif Input.is_action_pressed("Left"):
		_animated_sprite.play("Walking")
		_animated_sprite.flip_h = true
		velocity.x -= SPEED
	else:
		_animated_sprite.stop()
		
	
	# Gravity
	velocity.y = velocity.y + GRAVITY
	
	# Jump
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP


	velocity = move_and_slide(velocity)
	
	# Friction
	velocity.x = lerp(velocity.x,0,0.1)
