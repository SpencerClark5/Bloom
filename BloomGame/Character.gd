extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 50
const GRAVITY = 30
const JUMP = -900
onready var _animated_sprite = $AnimatedSprite
onready var _kinematicBody2D = $KinematicBody

func _physics_process(delta):
	
	if Input.is_action_pressed("Right"):
		velocity.x += SPEED
		
	if Input.is_action_pressed("Left"):
		velocity.x -= SPEED
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP


	velocity = move_and_slide(velocity)
