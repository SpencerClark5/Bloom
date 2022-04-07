extends AnimatedSprite

onready var _animated_sprite_Right_Leg = $Rightleg


func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightLegAnim"
			self.flip_h = false
			
			self.play("RightLegAnim")
		else:
			self.animation = "RightLegJumpAnim"
			self.flip_h = false
			
			self.play("RightLegJumpAnim")
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "RightLegAnim"
			self.flip_h = true
			
			self.play("RightLegAnim")
		else:
			self.animation = "RightLegJumpAnim"
			self.flip_h = true
			
			self.play("RightLegJumpAnim")
