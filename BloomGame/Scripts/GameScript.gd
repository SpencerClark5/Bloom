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
	PlantInstance.position = get_node("Flora").get_position()
	add_child(PlantInstance)
	print("planted")
	
#when the player wants to spawn the plant
#instance the plant scene after button press
