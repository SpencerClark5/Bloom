extends AnimatedSprite

var velocity = Vector2(0,0)

onready var _animated_sprite_Body = $Body

func _physics_process(delta):
	
	if(velocity.y >0 || velocity.y<0):
		print("moved")
#	if Input.is_action_pressed("Right"):
#		if(velocity.y == 0):
#			_animated_sprite_Body.play("TorsoRunAnim")
#			_animated_sprite_Body.frame = 0
#			_animated_sprite_Body.animation = "TorsoRunAnim"
#			_animated_sprite_Body.flip_h = false
#		else:
#			_animated_sprite_Body.play("TorsoJumpnAnim")
#			_animated_sprite_Body.frame = 0
#			_animated_sprite_Body.animation = "TorsoRunAnim"
#			_animated_sprite_Body.flip_h = false
#
#
#	elif Input.is_action_pressed("Left"):
#		_animated_sprite_Body.frame = 0
#		_animated_sprite_Body.play("TorsoRunAnim")
#		_animated_sprite_Body.animation = "TorsoRunAnim"
#		_animated_sprite_Body.flip_h = true
