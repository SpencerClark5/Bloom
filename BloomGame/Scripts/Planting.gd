extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _animated_sprite = $AnimatedSprite
onready var _plant = get_node("StaticBody2D/Plant")

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("PlantAnim")
	_plant.disabled = true
	#$StaticBody2D/Plant.disabled = true
	##after the animation (yeild) turn on the collider
	
	
	# maybe make another function to unplant
	# just do everything in plant except backwards
func _enableCollider():
	print ("Called!")
	_plant.disabled = false
