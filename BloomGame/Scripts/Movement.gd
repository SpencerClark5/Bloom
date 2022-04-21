extends KinematicBody2D


const JUMP_FORCE = 750			# Force applied on jumping
const MOVE_SPEED = 250			# Speed to walk with
const GRAVITY = 30				# Gravity applied every second
const MAX_SPEED = 1000000			# Maximum speed the player is allowed to move
const FRICTION_GROUND = 0.5	# The friction while on the ground
const CHAIN_PULL = 30
const CLIMB_SPEED = 50

var velocity = Vector2(0,0)		# The velocity of the player (kept over time)
var chain_velocity := Vector2(0,0)
var can_jump = false			# Whether the player used their air-jump
var endOfIdle = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if(GlobalVariables.canGrapple):
			if event.pressed:
				# We clicked the mouse -> shoot()
				$Chain.shoot(event.position - get_viewport().size * 0.5)
			else:
				# We released the mouse -> release()
				$Chain.release()


onready var _animated_sprite_Body = $Body
onready var _animated_sprite_RightArm = $RightArm
onready var _animated_sprite_LeftArm = $LeftArm
onready var _animated_sprite_LeftLeg = $LeftLeg
onready var _animated_sprite_RightLeg = $RightLeg
onready var _animated_sprite_Idle = $IdleSprite
onready var _animated_sprite_Wall_Climb = $TransitionSprite
onready var _jump_sound = $Body/JumpSound
onready var _walking_sound = $Camera2D/WalkingSound
onready var _landing_sound = $Body/LandingSound
onready var _wall_sounds = $Body/WallSounds
onready var only_once = true

var time_elapsed = 0.0


#this should work for having the randomish sounds
func _choosing_wall_sounds(var path)->void:
	var file = File.new()
	if (file.file_exists(path)):
		file.open(path,file.READ)
		var buffer = file.get_buffer(file.get_len())
		var stream = AudioStreamSample.new()
		stream.data = buffer
		_wall_sounds.stream = stream
		_wall_sounds.play()




func _physics_process(_delta: float) -> void:
	# Walking
	var walk = (Input.get_action_strength("Right") - Input.get_action_strength("Left")) * MOVE_SPEED

	# Falling
	velocity.y += GRAVITY

	# Hook physics
	#if chain is hooked and colliding with stalactite
	if $Chain.hooked:
		# `to_local($Chain.tip).normalized()` is the direction that the chain is pulling
		chain_velocity = to_local($Chain.tip).normalized() * CHAIN_PULL
		if chain_velocity.y > 0:
			# Pulling down isn't as strong
			chain_velocity.y *= 0.55
		else:
			# Pulling up is stronger
			chain_velocity.y *= 1.65
		if sign(chain_velocity.x) != sign(walk):
			# if we are trying to walk in a different
			# direction than the chain is pulling
			# reduce its pull
			chain_velocity.x *= 0.7
	else:
		# Not hooked -> no chain velocity
		chain_velocity = Vector2(0,0)
	velocity += chain_velocity



#this deals with walking
	velocity.x += walk		# apply the walking
	move_and_slide(velocity, Vector2.UP)	# Actually apply all the forces
	velocity.x -= walk		# take away the walk speed again
	# ^ This is done so we don't build up walk speed over time

	# Manage friction and refresh jump and stuff
	velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)	# Make sure we are in our limits
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	var grounded = is_on_floor()
	if grounded:
		velocity.x *= FRICTION_GROUND	# Apply friction only on x (we are not moving on y anyway)
		can_jump = true 				# We refresh our air-jump
		if velocity.y >= 5:		# Keep the y-velocity small such that
			velocity.y = 5		# gravity doesn't make this number huge
	elif is_on_ceiling() and velocity.y <= -5:	# Same on ceilings
		velocity.y = -5
#
	# Jumping
	#var jumped = false
	if Input.is_action_just_pressed("Jump"):
		if (grounded && GlobalVariables.canSingleJump):
			velocity.y = -JUMP_FORCE	# Apply the jump-force
			_jump_sound.play()
			#jumped = true
		elif (can_jump && GlobalVariables.canDoubleJump):
			_jump_sound.play()
			can_jump = false	# Used air-jump
			velocity.y = -JUMP_FORCE
			#jumped = true
			
			GlobalVariables.isClimbing = false
	#if (jumped and grounded):
		#_landing_sound.play()


#my code ends here, everything below is cams
# i commented out some of your movement

	#setting global variable for the kinematicbody's y velocity
	GlobalVariables.yVelocity = velocity.y













	#  Animation 
	if Input.is_action_pressed("Right"):
		_animated_sprite_Idle.visible = false
		_animated_sprite_Wall_Climb.visible = false
		_animated_sprite_Body.visible = true
		if(GlobalVariables.LeftArmOn):
			_animated_sprite_LeftArm.visible = true
		if(GlobalVariables.LeftLegOn):
			_animated_sprite_LeftLeg.visible = true
		if(GlobalVariables.RightArmOn):
			_animated_sprite_RightArm.visible = true
		if(GlobalVariables.RightLegOn):
			_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0
		
		#okay so, this is to make sure the audio file is only playing once
		if not (_walking_sound.is_playing()):
			_walking_sound.play()
		
		
		GlobalVariables.isClimbing = false
		_animated_sprite_Wall_Climb.flip_h = false
		_animated_sprite_Idle.flip_h = false
		
		endOfIdle = false
	
	elif Input.is_action_pressed("Left"):
	
		#Turns anims on
		_animated_sprite_Idle.visible = false
		_animated_sprite_Wall_Climb.visible = false
		_animated_sprite_Body.visible = true
		if(GlobalVariables.LeftArmOn):
			_animated_sprite_LeftArm.visible = true
		if(GlobalVariables.LeftLegOn):
			_animated_sprite_LeftLeg.visible = true
		if(GlobalVariables.RightArmOn):
			_animated_sprite_RightArm.visible = true
		if(GlobalVariables.RightLegOn):
			_animated_sprite_RightLeg.visible = true

		_animated_sprite_Idle.stop()
		_animated_sprite_Idle.frame = 0
		time_elapsed = 0
		
		#okay so, this is to make sure the audio file is only playing once
		if not (_walking_sound.is_playing()):
			_walking_sound.play()
		
		GlobalVariables.isClimbing = false
		_animated_sprite_Wall_Climb.flip_h = true
		_animated_sprite_Idle.flip_h = true
		
		endOfIdle = false
		
		
	elif Input.is_action_just_pressed("EnterClimb"):
		print("enter climb")
		_wall_sounds.play()
		GlobalVariables.isClimbing = true
	elif Input.is_action_pressed("Climb"):
		
		#creates a random number
#		var rng = RandomNumberGenerator.new()
#		rng.randomize()
#		var _sound_to_play = rng.randi_range(1,3)
#
#		#chooses which sounds to play based on the number
#		match _sound_to_play:
#			1:
#				_choosing_wall_sounds("res://Music/Wall Movement/Wall Movement 1_1.wav")
#			2:
#				_choosing_wall_sounds("res://Music/Wall Movement/Wall Movement 2_1.wav")
#			3:
#				_choosing_wall_sounds("res://Music/Wall Movement/Wall Movement 3_1.wav")
#
		if(GlobalVariables.inClimbArea):
			velocity.y -= CLIMB_SPEED
			
		
	#Idle anim
	else:
		
		if((velocity.y == 5 && grounded) && (GlobalVariables.isPlanting == false && GlobalVariables.isClimbing == false)):
#			_animated_sprite_Idle.visible = true
#			_animated_sprite_Wall_Climb.visible = false
#			_animated_sprite_Body.visible = false
#			_animated_sprite_LeftArm.visible = false
#			_animated_sprite_LeftLeg.visible = false
#			_animated_sprite_RightArm.visible = false
#			_animated_sprite_RightLeg.visible = false
			
			_animated_sprite_Wall_Climb.visible = false
			_animated_sprite_Body.visible = true
			if(GlobalVariables.LeftArmOn):
				_animated_sprite_LeftArm.visible = true
			else:
				_animated_sprite_LeftArm.visible = false
			if(GlobalVariables.LeftLegOn):
				_animated_sprite_LeftLeg.visible = true
			else:
				_animated_sprite_LeftLeg.visible = false
			if(GlobalVariables.RightArmOn):
				_animated_sprite_RightArm.visible = true
			else:
				_animated_sprite_RightArm.visible = false
			if(GlobalVariables.RightLegOn):
				_animated_sprite_RightLeg.visible = true
			else:
				_animated_sprite_RightLeg.visible = false
			
			_animated_sprite_Wall_Climb.stop()
			_animated_sprite_Wall_Climb.frame = 0
			
			_walking_sound.stop()
			
			
			
			time_elapsed += _delta
			if(time_elapsed > 3):
#				_animated_sprite_Idle.play("Idle")
				if((_animated_sprite_Body.frame < 4)&&!endOfIdle):
					_animated_sprite_Body.play("TorsoIdleAnim")
					_animated_sprite_RightArm.play("RightArmIdleAnim")
					_animated_sprite_LeftArm.play("LeftArmIdleAnim")
					_animated_sprite_LeftLeg.play("LeftLegIdleAnim")
					_animated_sprite_RightLeg.play("RightLegIdleAnim")
					
				elif((_animated_sprite_Body.frame >= 4 && _animated_sprite_Body.frame < 10) && !endOfIdle):
					_animated_sprite_LeftArm.visible = false
					_animated_sprite_LeftLeg.visible = false
					_animated_sprite_RightArm.visible = false
					_animated_sprite_RightLeg.visible = false
					
#					_animated_sprite_Body.play("TorsoIdleAnim")
				else:
					
					endOfIdle = true
					_animated_sprite_LeftArm.visible = false
					_animated_sprite_LeftLeg.visible = false
					_animated_sprite_RightArm.visible = false
					_animated_sprite_RightLeg.visible = false
					_animated_sprite_Body.animation = "IdleCont"
					_animated_sprite_Body.play("IdleCont")
			else:
				_animated_sprite_Body.animation = "TorsoIdleAnim"
				_animated_sprite_Body.flip_h = false

				_animated_sprite_RightArm.animation = "RightArmIdleAnim"
				_animated_sprite_RightArm.flip_h = false

				_animated_sprite_LeftArm.animation = "LeftArmIdleAnim"
				_animated_sprite_LeftArm.flip_h = false

				_animated_sprite_LeftLeg.animation = "LeftLegIdleAnim"
				_animated_sprite_LeftLeg.flip_h = false

				_animated_sprite_RightLeg.animation = "RightLegIdleAnim"
				_animated_sprite_RightLeg.flip_h = false
				
				_animated_sprite_Body.frame = 0
				_animated_sprite_Body.stop()
				_animated_sprite_RightArm.frame = 0
				_animated_sprite_RightArm.stop()
				_animated_sprite_LeftArm.frame = 0
				_animated_sprite_LeftArm.stop()
				_animated_sprite_RightLeg.frame = 0
				_animated_sprite_RightLeg.stop()
				_animated_sprite_LeftLeg.frame = 0
				_animated_sprite_LeftLeg.stop()
				
			
				
				
		elif((velocity.y > 5 || velocity.y < 5) && (GlobalVariables.isPlanting == false && GlobalVariables.isClimbing == false)):
			_animated_sprite_Idle.visible = false
			_animated_sprite_Wall_Climb.visible = false
			_animated_sprite_Body.visible = true
			if(GlobalVariables.LeftArmOn):
				_animated_sprite_LeftArm.visible = true
			if(GlobalVariables.LeftLegOn):
				_animated_sprite_LeftLeg.visible = true
			if(GlobalVariables.RightArmOn):
				_animated_sprite_RightArm.visible = true
			if(GlobalVariables.RightLegOn):
				_animated_sprite_RightLeg.visible = true

			_animated_sprite_Wall_Climb.stop()
			_animated_sprite_Wall_Climb.frame = 0
			
			_animated_sprite_Idle.stop()
			_animated_sprite_Idle.frame = 0
			time_elapsed = 0
			
			endOfIdle = false

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
			
			
		elif(GlobalVariables.inPlantArea && GlobalVariables.isPlanting):
			_animated_sprite_Idle.visible = false
			_animated_sprite_Wall_Climb.visible = false
			_animated_sprite_Body.visible = true
			if(GlobalVariables.LeftArmOn):
				_animated_sprite_LeftArm.visible = true
			if(GlobalVariables.LeftLegOn):
				_animated_sprite_LeftLeg.visible = true
			if(GlobalVariables.RightArmOn):
				_animated_sprite_RightArm.visible = true
			if(GlobalVariables.RightLegOn):
				_animated_sprite_RightLeg.visible = true

			_animated_sprite_Wall_Climb.stop()
			_animated_sprite_Wall_Climb.frame = 0
			
			_animated_sprite_Idle.stop()
			_animated_sprite_Idle.frame = 0
			time_elapsed = 0
			
			endOfIdle = false

			_animated_sprite_Body.animation = "TorsoPlantingAnim"
			_animated_sprite_Body.flip_h = false

			_animated_sprite_RightArm.animation = "RightArmPlantingAnim"
			_animated_sprite_RightArm.flip_h = false

			_animated_sprite_LeftArm.animation = "LeftArmPlantingAnim"
			_animated_sprite_LeftArm.flip_h = false

			_animated_sprite_LeftLeg.animation = "LeftLegPlantingAnim"
			_animated_sprite_LeftLeg.flip_h = false

			_animated_sprite_RightLeg.animation = "RightLegPlantingAnim"
			_animated_sprite_RightLeg.flip_h = false
			
			
			_animated_sprite_Body.play("TorsoPlantingAnim")
			_animated_sprite_RightArm.play("RightArmPlantingAnim")
			_animated_sprite_LeftArm.play("LeftArmPlantingAnim")
			_animated_sprite_LeftLeg.play("LeftLegPlantingAnim")
			_animated_sprite_RightLeg.play("RightLegPlantingAnim")
			
			
		elif(GlobalVariables.inClimbArea && GlobalVariables.isClimbing && GlobalVariables.canClimb):
			_animated_sprite_Idle.visible = false
			_animated_sprite_Wall_Climb.visible = true
			_animated_sprite_Body.visible = false
			_animated_sprite_LeftArm.visible = false
			_animated_sprite_LeftLeg.visible = false
			_animated_sprite_RightArm.visible = false
			_animated_sprite_RightLeg.visible = false
			
			_animated_sprite_Idle.stop()
			_animated_sprite_Idle.frame = 0
			time_elapsed = 0
			
			endOfIdle = false
			
			_animated_sprite_Wall_Climb.play("TransitionToWall")
			if(_animated_sprite_Wall_Climb.frame == 13):
				_animated_sprite_Wall_Climb.stop()
