extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 30
const GRAVITY = 30
const JUMP = -700
onready var _animated_sprite_Body = $Body
onready var _animated_sprite_RightArm = $RightArm
onready var _animated_sprite_LeftArm = $LeftArm
onready var _animated_sprite_LeftLeg = $LeftLeg
onready var _animated_sprite_RightLeg = $RightLeg
onready var _animated_sprite_Jump = $NewJumpingSprite
onready var _animated_sprite_Idle = $IdleSprite
onready var _animated_sprite_Plant = $PlantingSprite

func _physics_process(delta):
	
	# Movement and animation 
	if Input.is_action_pressed("Right"):
		
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true
		_animated_sprite_Jump.visible = false
		
		_animated_sprite_Idle.stop()
		
		_animated_sprite_Body.play("TorsoRunAnim")
		_animated_sprite_Body.flip_h = false
		
		_animated_sprite_RightArm.play("RightArmRun")
		_animated_sprite_RightArm.flip_h = false
		
		_animated_sprite_LeftArm.play("LeftArmRun")
		_animated_sprite_LeftArm.flip_h = false
		
		_animated_sprite_LeftLeg.play("LeftLegRun")
		_animated_sprite_LeftLeg.flip_h = false
		
		_animated_sprite_RightLeg.play("RightLegRun")
		_animated_sprite_RightLeg.flip_h = false
		
		velocity.x += SPEED
	
	elif Input.is_action_pressed("Left"):
		
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true
		_animated_sprite_Jump.visible = false
		_animated_sprite_Idle.stop()
		
		_animated_sprite_Body.play("TorsoRunAnim")
		_animated_sprite_Body.flip_h = true
		
		_animated_sprite_RightArm.play("RightArmRun")
		_animated_sprite_RightArm.flip_h = true
		
		_animated_sprite_LeftArm.play("LeftArmRun")
		_animated_sprite_LeftArm.flip_h = true
		
		_animated_sprite_LeftLeg.play("LeftLegRun")
		_animated_sprite_LeftLeg.flip_h = true
		
		_animated_sprite_RightLeg.play("RightLegRun")
		_animated_sprite_RightLeg.flip_h = true
		velocity.x -= SPEED
	# Jump
	elif Input.is_action_just_pressed("Jump"):
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = false
		_animated_sprite_LeftArm.visible = false
		_animated_sprite_LeftLeg.visible = false
		_animated_sprite_RightArm.visible = false
		_animated_sprite_RightLeg.visible = false
		
		_animated_sprite_Jump.visible = true
		_animated_sprite_Jump.play("NewJump")
#		velocity.y = JUMP
	else:
		_animated_sprite_Idle.visible = true
		_animated_sprite_Idle.play("Idle")
		
		_animated_sprite_Body.visible = false
		_animated_sprite_LeftArm.visible = false
		_animated_sprite_LeftLeg.visible = false
		_animated_sprite_RightArm.visible = false
		_animated_sprite_RightLeg.visible = false
		_animated_sprite_Jump.visible = false
		
		
#		_animated_sprite_Body.stop()
#		_animated_sprite_LeftArm.stop()
#		_animated_sprite_LeftLeg.stop()
#		_animated_sprite_RightArm.stop()
#		_animated_sprite_RightLeg.stop()
	
	# Gravity
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP
	
	velocity = move_and_slide(velocity)
	
	# Friction
	velocity.x = lerp(velocity.x,0,0.1)
