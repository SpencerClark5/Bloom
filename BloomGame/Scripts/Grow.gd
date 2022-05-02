extends Area2D

onready var _sprite_seed = $Seedling
onready var _collider_seed = $SeedCollider


func _on_Area2D11_body_entered(body):
	GlobalVariables.canGrow = true
	print("in grow")
	_sprite_seed.visible = false
	_collider_seed.disabled = true
	
	GlobalVariables.isGrowing = true
	
	if(GlobalVariables.fourthLimb == "Leg"):
		GlobalVariables.RightLegOn = true
		GlobalVariables.canSingleJump = true
		GlobalVariables.fourthLimb = "null"
	elif(GlobalVariables.fourthLimb == "Arm"):
		GlobalVariables.RightArmOn = true
		GlobalVariables.canClimb = true
		GlobalVariables.fourthLimb = "null"
		
	elif(GlobalVariables.thirdLimb == "Leg"):
		GlobalVariables.RightLegOn = true
		GlobalVariables.canSingleJump = true
		GlobalVariables.thirdLimb = "null"
	elif(GlobalVariables.thirdLimb == "Arm"):
		GlobalVariables.RightArmOn = true
		GlobalVariables.canClimb = true
		GlobalVariables.thirdLimb = "null"
		
	elif(GlobalVariables.secondLimb == "Leg"):
		if(GlobalVariables.RightLegOn):
			GlobalVariables.LeftLegOn = true
			GlobalVariables.canDoubleJump = true
		else:
			GlobalVariables.RightLegOn = true
			GlobalVariables.canSingleJump = true
		GlobalVariables.secondLimb = "null"
	elif(GlobalVariables.secondLimb == "Arm"):
		if(GlobalVariables.RightArmOn):
			GlobalVariables.LeftArmOn = true
			GlobalVariables.canGrapple = true
		else:
			GlobalVariables.RightArmOn = true
			GlobalVariables.canClimb = true
		GlobalVariables.secondLimb = "null"
		
	elif(GlobalVariables.firstLimb == "Leg"):
		GlobalVariables.LeftLegOn = true
		GlobalVariables.canDoubleJump = true
		GlobalVariables.firstLimb = "null"
	elif(GlobalVariables.firstLimb == "Arm"):
		GlobalVariables.LeftArmOn = true
		GlobalVariables.canGrapple = true
		GlobalVariables.firstLimb = "null"
	queue_free()
	if(GlobalVariables.timesPlanted != 0):
		GlobalVariables.timesPlanted -= 1


func _on_Area2D11_body_exited(body):
	GlobalVariables.canGrow = false
	print("exit grow")
	
