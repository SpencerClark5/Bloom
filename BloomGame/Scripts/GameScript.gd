extends Node2D
class_name GameScript

onready var RightArm = $Flora/FloraBody/RightArm
onready var LeftArm = $Flora/FloraBody/LeftArm
onready var RightLeg = $Flora/FloraBody/RightLeg
onready var LeftLeg = $Flora/FloraBody/LeftLeg



var smallPlant = preload("res://Scenes/Plant.tscn")
export var test = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(GlobalVariables.inPlantArea):
		if Input.is_action_just_pressed("PlantLeg"):
			print("CALLED PLANTLEG")
			if(LeftLeg.is_visible()):
				print("IN THE IF")
				plant()
				GlobalVariables.isPlanting = true
				LeftLeg.hide();
			else:
				print("IN THE ELSE")
				plant()
				GlobalVariables.isPlanting = true
				RightLeg.hide()
		if Input.is_action_just_pressed("PlantArm"):
			if(LeftArm.visible == true):
				print("PLANTED LEFT ARM")
				plant()
				GlobalVariables.isPlanting = true
				LeftArm.visible = false;
			else:
				plant()
				GlobalVariables.isPlanting = true
				RightArm.visible = false;
		
#	if(GlobalVariables.inPlantArea):
#		if Input.is_action_just_pressed("Plant"):
#			plant()
#			GlobalVariables.isPlanting = true
	



func plant():
	#get the position of the player to instance the node here
	var PlantInstance = smallPlant.instance()
	add_child(PlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	PlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted")
	
#when the player wants to spawn the plant
#instance the plant scene after button press
