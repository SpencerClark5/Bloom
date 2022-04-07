extends AnimatedSprite

onready var _animated_sprite_Right_Arm = $RightArm


func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightArmRun"
			self.flip_h = false
			
			self.play("RightArmRun")
		else:
			self.animation = "RightArmJumpAnim"
			self.flip_h = false
			
			self.play("RightArmJumpAnim")
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightArmRun"
			self.flip_h = true
			
			self.play("RightArmRun")
		else:
			self.animation = "RightArmJumpAnim"
			self.flip_h = true
			
			self.play("RightArmJumpAnim")
