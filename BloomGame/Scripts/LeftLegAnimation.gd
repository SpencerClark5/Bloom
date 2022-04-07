extends AnimatedSprite

onready var _animated_sprite_Left_Leg = $LeftLeg


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "LeftLegRun"
			self.flip_h = false
			
			self.play("LeftLegRun")
		else:
			self.animation = "LeftLegJumpAnim"
			self.flip_h = false
			
			self.play("LeftLegJumpAnim")
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "LeftLegRun"
			self.flip_h = true
			
			self.play("LeftLegRun")
		else:
			self.animation = "LeftLegJumpAnim"
			self.flip_h = true
			
			self.play("LeftLegJumpAnim")
