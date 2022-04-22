extends Area2D

onready var _sprite_seed = $Seedling
onready var _collider_seed = $SeedCollider


func _on_Area2D11_body_entered(body):
	GlobalVariables.canGrow = true
	print("in grow")
	_sprite_seed.visible = false
	_collider_seed.disabled = true
	
	GlobalVariables.isGrowing = true
	


func _on_Area2D11_body_exited(body):
	GlobalVariables.canGrow = false
	print("exit grow")
	
