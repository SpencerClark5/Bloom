extends AnimatedSprite

onready var _animated_sprite_Right_Leg = $Rightleg
onready var _walking_sounds = get_parent().get_node("Camera2D/WalkingSound")



func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightLegAnim"
			self.flip_h = false
			
			
			self.play("RightLegAnim")
			if not (_walking_sounds.is_playing()):
				_walking_sounds.play()
		else:
			self.animation = "RightLegJumpAnim"
			self.flip_h = false
			
			self.play("RightLegJumpAnim")
			_walking_sounds.stop()
			
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightLegAnim"
			self.flip_h = true
			
			self.play("RightLegAnim")
			if not (_walking_sounds.is_playing()):
				_walking_sounds.play()
		else:
			self.animation = "RightLegJumpAnim"
			self.flip_h = true
			
			self.play("RightLegJumpAnim")
			_walking_sounds.stop()
