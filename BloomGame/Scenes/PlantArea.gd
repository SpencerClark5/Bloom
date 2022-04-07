extends Area2D

func _on_Area2D2_body_entered(body):
	GlobalVariables.inPlantArea = true


func _on_Area2D2_body_exited():
	GlobalVariables.inPlantArea = false
