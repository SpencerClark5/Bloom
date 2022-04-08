extends Area2D

func _on_Area2D2_body_entered(body):
	print("in plant area")
	GlobalVariables.inPlantArea = true


func _on_Area2D2_body_exited():
	print("left plant area")
	GlobalVariables.inPlantArea = false
