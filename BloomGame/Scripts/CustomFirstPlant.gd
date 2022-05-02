extends Area2D

func _on_big_plant_area_body_entered(body):
	print ("in big plant area")
	GlobalVariables.inBigPlantArea = true


func _on_big_plant_area_body_exited(body):
	
	print ("left big plant area")
	GlobalVariables.inBigPlantArea = false
