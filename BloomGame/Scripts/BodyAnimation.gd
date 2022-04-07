extends AnimatedSprite

onready var _animated_sprite_Body = $Body


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		
		if(GlobalVariables.yVelocity == 5):
			self.animation = "TorsoRunAnim"
			self.flip_h = false
			
			self.play("TorsoRunAnim")
		else:
			self.animation = "TorsoJumpAnim"
			self.flip_h = false
			
			self.play("TorsoJumpAnim")
	elif Input.is_action_pressed("Left"):
		if(GlobalVariables.yVelocity == 5):
			self.animation = "TorsoRunAnim"
			self.flip_h = true
			
			self.play("TorsoRunAnim")
		else:
			self.animation = "TorsoJumpAnim"
			self.flip_h = true
			
			self.play("TorsoJumpAnim")
