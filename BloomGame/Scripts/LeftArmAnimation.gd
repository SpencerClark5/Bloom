extends AnimatedSprite

onready var _animated_sprite_Left_Arm = $LeftArm


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "LeftArmRun"
			self.flip_h = false
			
			self.play("LeftArmRun")
		else:
			self.animation = "LeftArmJumpAnim"
			self.flip_h = false
			
			self.play("LeftArmJumpAnim")
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "LeftArmRun"
			self.flip_h = true
			
			self.play("LeftArmRun")
		else:
			self.animation = "LeftArmJumpAnim"
			self.flip_h = true
			
			self.play("LeftArmJumpAnim")
