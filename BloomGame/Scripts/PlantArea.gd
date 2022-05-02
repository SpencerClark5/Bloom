extends Area2D



func _on_Area2D2_body_entered(body):
	
#	get_parent().add_child(dialog)
	print("in plant area")
	GlobalVariables.inPlantArea = true


func _on_Area2D2_body_exited(body):
	print("left plant area")
	GlobalVariables.inPlantArea = false
