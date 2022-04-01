extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 125
const GRAVITY = 30
const JUMP = -700
onready var _animated_sprite_Body = $Body
onready var _animated_sprite_RightArm = $RightArm
onready var _animated_sprite_LeftArm = $LeftArm
onready var _animated_sprite_LeftLeg = $LeftLeg
onready var _animated_sprite_RightLeg = $RightLeg
onready var _animated_sprite_Idle = $IdleSprite

var time_elapsed = 0.0
var plant_timer = 0.0

var isOnGround = 0
var isPlanting = 0
	
func _physics_process(delta):
	
	# Movement and animation 
	if Input.is_action_pressed("Right"):
		#Temporary until idle anim is added
		#Turns anims on
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0
		
		if(velocity.y == 0):
			#Set each anim to run
			
			_animated_sprite_Body.animation = "TorsoRunAnim"
			_animated_sprite_Body.flip_h = false

			_animated_sprite_RightArm.animation = "RightArmRun"
			_animated_sprite_RightArm.flip_h = false

			_animated_sprite_LeftArm.animation = "LeftArmRun"
			_animated_sprite_LeftArm.flip_h = false

			_animated_sprite_LeftLeg.animation = "LeftLegRun"
			_animated_sprite_LeftLeg.flip_h = false

			_animated_sprite_RightLeg.animation = "RightLegAnim"
			_animated_sprite_RightLeg.flip_h = false
			
			#play run anim
			
			_animated_sprite_Body.play("TorsoRunAnim")
			_animated_sprite_RightArm.play("RightArmRun")
			_animated_sprite_LeftArm.play("LeftArmRun")
			_animated_sprite_LeftLeg.play("LeftLegRun")
			_animated_sprite_RightLeg.play("RightLegAnim")
			
			isOnGround = 0
			
		else:
			_animated_sprite_Body.animation = "TorsoJumpAnim"
			_animated_sprite_Body.flip_h = false

			_animated_sprite_RightArm.animation = "RightArmJumpAnim"
			_animated_sprite_RightArm.flip_h = false

			_animated_sprite_LeftArm.animation = "LeftArmJumpAnim"
			_animated_sprite_LeftArm.flip_h = false

			_animated_sprite_LeftLeg.animation = "LeftLegJumpAnim"
			_animated_sprite_LeftLeg.flip_h = false

			_animated_sprite_RightLeg.animation = "RightLegJumpAnim"
			_animated_sprite_RightLeg.flip_h = false
			
			
			_animated_sprite_Body.play("TorsoJumpAnim")
			_animated_sprite_RightArm.play("RightArmJumpAnim")
			_animated_sprite_LeftArm.play("LeftArmJumpAnim")
			_animated_sprite_LeftLeg.play("LeftLegJumpAnim")
			_animated_sprite_RightLeg.play("RightLegJumpAnim")
			
		velocity.x += SPEED
	
	elif Input.is_action_pressed("Left"):
	#Temporary until idle anim is added
		#Turns anims on
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0
		
		if(velocity.y == 0):
			#Set each anim to run
			
			_animated_sprite_Body.animation = "TorsoRunAnim"
			_animated_sprite_Body.flip_h = true

			_animated_sprite_RightArm.animation = "RightArmRun"
			_animated_sprite_RightArm.flip_h = true

			_animated_sprite_LeftArm.animation = "LeftArmRun"
			_animated_sprite_LeftArm.flip_h = true

			_animated_sprite_LeftLeg.animation = "LeftLegRun"
			_animated_sprite_LeftLeg.flip_h = true

			_animated_sprite_RightLeg.animation = "RightLegAnim"
			_animated_sprite_RightLeg.flip_h = true
			
			#play run anim
			
			_animated_sprite_Body.play("TorsoRunAnim")
			_animated_sprite_RightArm.play("RightArmRun")
			_animated_sprite_LeftArm.play("LeftArmRun")
			_animated_sprite_LeftLeg.play("LeftLegRun")
			_animated_sprite_RightLeg.play("RightLegAnim")
			
			isOnGround = 0
			
		else:
			_animated_sprite_Body.animation = "TorsoJumpAnim"
			_animated_sprite_Body.flip_h = true

			_animated_sprite_RightArm.animation = "RightArmJumpAnim"
			_animated_sprite_RightArm.flip_h = true

			_animated_sprite_LeftArm.animation = "LeftArmJumpAnim"
			_animated_sprite_LeftArm.flip_h = true

			_animated_sprite_LeftLeg.animation = "LeftLegJumpAnim"
			_animated_sprite_LeftLeg.flip_h = true

			_animated_sprite_RightLeg.animation = "RightLegJumpAnim"
			_animated_sprite_RightLeg.flip_h = true
			
			
			_animated_sprite_Body.play("TorsoJumpAnim")
			_animated_sprite_RightArm.play("RightArmJumpAnim")
			_animated_sprite_LeftArm.play("LeftArmJumpAnim")
			_animated_sprite_LeftLeg.play("LeftLegJumpAnim")
			_animated_sprite_RightLeg.play("RightLegJumpAnim")
		velocity.x -= SPEED
		
	# Jump
	elif Input.is_action_just_pressed("Jump"):
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0

		if(velocity.x >= 0):
			_animated_sprite_Body.animation = "TorsoJumpAnim"
			_animated_sprite_Body.flip_h = false

			_animated_sprite_RightArm.animation = "RightArmJumpAnim"
			_animated_sprite_RightArm.flip_h = false

			_animated_sprite_LeftArm.animation = "LeftArmJumpAnim"
			_animated_sprite_LeftArm.flip_h = false

			_animated_sprite_LeftLeg.animation = "LeftLegJumpAnim"
			_animated_sprite_LeftLeg.flip_h = false

			_animated_sprite_RightLeg.animation = "RightLegJumpAnim"
			_animated_sprite_RightLeg.flip_h = false
			
			
			_animated_sprite_Body.play("TorsoJumpAnim")
			_animated_sprite_RightArm.play("RightArmJumpAnim")
			_animated_sprite_LeftArm.play("LeftArmJumpAnim")
			_animated_sprite_LeftLeg.play("LeftLegJumpAnim")
			_animated_sprite_RightLeg.play("RightLegJumpAnim")
			
		else:
			_animated_sprite_Body.animation = "TorsoJumpAnim"
			_animated_sprite_Body.flip_h = true

			_animated_sprite_RightArm.animation = "RightArmJumpAnim"
			_animated_sprite_RightArm.flip_h = true

			_animated_sprite_LeftArm.animation = "LeftArmJumpAnim"
			_animated_sprite_LeftArm.flip_h = true

			_animated_sprite_LeftLeg.animation = "LeftLegJumpAnim"
			_animated_sprite_LeftLeg.flip_h = true

			_animated_sprite_RightLeg.animation = "RightLegJumpAnim"
			_animated_sprite_RightLeg.flip_h = true
			
			
			_animated_sprite_Body.play("TorsoJumpAnim")
			_animated_sprite_RightArm.play("RightArmJumpAnim")
			_animated_sprite_LeftArm.play("LeftArmJumpAnim")
			_animated_sprite_LeftLeg.play("LeftLegJumpAnim")
			_animated_sprite_RightLeg.play("RightLegJumpAnim")
			

		if(velocity.y == 0):
			isOnGround = 0

	elif Input.is_action_just_pressed("Plant"):
		isPlanting = 1
		
		_animated_sprite_Idle.visible = false
		_animated_sprite_Body.visible = true
		_animated_sprite_LeftArm.visible = true
		_animated_sprite_LeftLeg.visible = true
		_animated_sprite_RightArm.visible = true
		_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0
		
		if(velocity.x >= 0):
			_animated_sprite_Body.animation = "TorsoPlantAnim"
			_animated_sprite_Body.flip_h = false

			_animated_sprite_RightArm.animation = "RightArmPlantAnim"
			_animated_sprite_RightArm.flip_h = false

			_animated_sprite_LeftArm.animation = "LeftArmPlantAnim"
			_animated_sprite_LeftArm.flip_h = false

			_animated_sprite_LeftLeg.animation = "LeftLegPlantAnim"
			_animated_sprite_LeftLeg.flip_h = false

			_animated_sprite_RightLeg.animation = "RightLegPlantAnim"
			_animated_sprite_RightLeg.flip_h = false
			
			
			_animated_sprite_Body.play("TorsoPlantAnim")
			_animated_sprite_RightArm.play("RightArmPlantAnim")
			_animated_sprite_LeftArm.play("LeftArmPlantAnim")
			_animated_sprite_LeftLeg.play("LeftLegPlantAnim")
			_animated_sprite_RightLeg.play("RightLegPlantAnim")
			
		else:
			_animated_sprite_Body.animation = "TorsoPlantAnim"
			_animated_sprite_Body.flip_h = true

			_animated_sprite_RightArm.animation = "RightArmPlantAnim"
			_animated_sprite_RightArm.flip_h = true

			_animated_sprite_LeftArm.animation = "LeftArmPlantAnim"
			_animated_sprite_LeftArm.flip_h = true

			_animated_sprite_LeftLeg.animation = "LeftLegPlantAnim"
			_animated_sprite_LeftLeg.flip_h = true

			_animated_sprite_RightLeg.animation = "RightLegPlantAnim"
			_animated_sprite_RightLeg.flip_h = true
			
			
			_animated_sprite_Body.play("TorsoPlantAnim")
			_animated_sprite_RightArm.play("RightArmPlantAnim")
			_animated_sprite_LeftArm.play("LeftArmPlantAnim")
			_animated_sprite_LeftLeg.play("LeftLegPlantAnim")
			_animated_sprite_RightLeg.play("RightLegPlantAnim")
			
			isOnGround = 0
			if(_animated_sprite_Body.frame == 4):
				isPlanting = 0;
		
	#Idle anim
	else:
#		if(isPlanting == 0):
			if(velocity.y == 0 || isOnGround):
				_animated_sprite_Idle.visible = true
				_animated_sprite_Body.visible = false
				_animated_sprite_LeftArm.visible = false
				_animated_sprite_LeftLeg.visible = false
				_animated_sprite_RightArm.visible = false
				_animated_sprite_RightLeg.visible = false
				
				
				isOnGround = 0
				
				time_elapsed += delta
				if(time_elapsed > 3):
					_animated_sprite_Idle.play("Idle")
		
	# Gravity
	velocity.y = velocity.y + GRAVITY
	
	#Player jump and double jump
	if (Input.is_action_just_pressed("Jump") && isOnGround < 2):
		velocity.y = JUMP
		isOnGround = isOnGround + 1
	
	velocity = move_and_slide(velocity)
	
	# Friction
	velocity.x = lerp(velocity.x,0,0.5)
#func _input(event):
#	if event.is_action_pressed("Plant"):
#		_animated_sprite_Idle.visible = false
#		_animated_sprite_Body.visible = true
#		_animated_sprite_LeftArm.visible = true
#		_animated_sprite_LeftLeg.visible = true
#		_animated_sprite_RightArm.visible = true
#		_animated_sprite_RightLeg.visible = true
#
#		if(velocity.x >= 0):
#			_animated_sprite_Body.animation = "TorsoPlantAnim"
#			_animated_sprite_Body.flip_h = false
#
#			_animated_sprite_RightArm.animation = "RightArmPlantAnim"
#			_animated_sprite_RightArm.flip_h = false
#
#			_animated_sprite_LeftArm.animation = "LeftArmPlantAnim"
#			_animated_sprite_LeftArm.flip_h = false
#
#			_animated_sprite_LeftLeg.animation = "LeftLegPlantAnim"
#			_animated_sprite_LeftLeg.flip_h = false
#
#			_animated_sprite_RightLeg.animation = "RightLegPlantAnim"
#			_animated_sprite_RightLeg.flip_h = false
#
#
#			_animated_sprite_Body.play("TorsoPlantAnim")
#			_animated_sprite_RightArm.play("RightArmPlantAnim")
#			_animated_sprite_LeftArm.play("LeftArmPlantAnim")
#			_animated_sprite_LeftLeg.play("LeftLegPlantAnim")
#			_animated_sprite_RightLeg.play("RightLegPlantAnim")
#
#		else:
#			_animated_sprite_Body.animation = "TorsoPlantAnim"
#			_animated_sprite_Body.flip_h = true
#
#			_animated_sprite_RightArm.animation = "RightArmPlantAnim"
#			_animated_sprite_RightArm.flip_h = true
#
#			_animated_sprite_LeftArm.animation = "LeftArmPlantAnim"
#			_animated_sprite_LeftArm.flip_h = true
#
#			_animated_sprite_LeftLeg.animation = "LeftLegPlantAnim"
#			_animated_sprite_LeftLeg.flip_h = true
#
#			_animated_sprite_RightLeg.animation = "RightLegPlantAnim"
#			_animated_sprite_RightLeg.flip_h = true
#
#
#			_animated_sprite_Body.play("TorsoPlantAnim")
#			_animated_sprite_RightArm.play("RightArmPlantAnim")
#			_animated_sprite_LeftArm.play("LeftArmPlantAnim")
#			_animated_sprite_LeftLeg.play("LeftLegPlantAnim")
#			_animated_sprite_RightLeg.play("RightLegPlantAnim")
#
#
