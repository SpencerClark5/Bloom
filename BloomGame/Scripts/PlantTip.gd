extends Control


func _physics_process(delta):
	if(GlobalVariables.inBigPlantArea):
		self.visible = true
	else:
		self.visible = false
