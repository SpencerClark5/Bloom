extends Control


var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		self.is_paused = !is_paused
		

func set_is_paused(value): 
	is_paused = value
	get_tree().paused = is_paused 
	visible = is_paused


func _on_ResumeButton_pressed():
	self.is_paused = false


func _on_Quit_pressed():
	get_tree().quit()


func _on_Button_pressed():
	GlobalVariables.RightArmOn = true
	GlobalVariables.LeftArmOn = true
	GlobalVariables.RightLegOn = true
	GlobalVariables.LeftLegOn = true
	GlobalVariables.firstLimb = "null"
	GlobalVariables.secondLimb = "null"
	GlobalVariables.thirdLimb = "null"
	GlobalVariables.fourthLimb = "null"
	GlobalVariables.timesPlanted = 0
	GlobalVariables.canClimb = true
	GlobalVariables.canGrapple = true
	GlobalVariables.canDoubleJump = true
	GlobalVariables.canSingleJump = true
	self.is_paused = false
	get_tree().change_scene("res://Scenes/Game.tscn")
