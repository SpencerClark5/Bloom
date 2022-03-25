extends Node2D


var smallPlant = preload("res://Scenes/Plant.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Plant"):
		Plant()
	

func Plant():
	#get the position of the player to instance the node here
	var PlantInstance = smallPlant.instance()
	add_child(PlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	PlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted")
	
#when the player wants to spawn the plant
#instance the plant scene after button press
