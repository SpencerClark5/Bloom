extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var _animated_sprite = $AnimatedSprite
onready var _plant = get_node("StaticBody2D/Plant")
onready var _animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#_animated_sprite.play("PlantAnim")
	_animation_player.play("PlantAnim")
	_plant.disabled = true
	#$StaticBody2D/Plant.disabled = true
	##after the animation (yeild) turn on the collider
	
	
	
func _enableCollider():
	print("Called!")
	_plant.disabled = false
