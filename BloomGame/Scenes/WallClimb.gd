extends Area2D


func _on_Area2D_body_entered(body):
	print ("in climb area")
	GlobalVariables.inClimbArea = true


func _on_Area2D_body_exited(body):
	print ("left climb area")
	GlobalVariables.inClimbArea = false
