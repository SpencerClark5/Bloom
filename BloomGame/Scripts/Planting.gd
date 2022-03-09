extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	_animated_sprite.play("PlantAnim")
	##after the animation (yeild) turn on the collider
	
	
	# maybe make another function to unplant
	# just do everything in plant except backwards


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
