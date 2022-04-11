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
		# when they press Q
		if Input.is_action_just_pressed("PlantLeg"):
			print("CALLED PLANTLEG")
			#if the left leg is visible
			if(LeftLeg.is_visible()):
				#test print
				print("IN THE IF")
				
				#call the plant function
				plant()
				#set the global isPlanting to true
				GlobalVariables.isPlanting = true
				#hide the left leg sprite
				LeftLeg.hide();
				#disable double jump
				
			else:
				#test print
				print("IN THE ELSE")
				#call the plant function
				plant()
				#turn on the isPlanting variable
				GlobalVariables.isPlanting = true
				#hide the right leg sprite
				RightLeg.hide()
				#disable the jump
				
		#when they press E 
		if Input.is_action_just_pressed("PlantArm"):
			#if the arm is visible
			if(LeftArm.visible == true):
				#test print
				print("PLANTED LEFT ARM")
				#call the plant function
				plant()
				#turn on the isPlanting
				GlobalVariables.isPlanting = true
				#toggle the visibility of the left arm
				LeftArm.visible = false;
				#disable wall climb
			else:
				#call plant function
				plant()
				#turn on the variable
				GlobalVariables.isPlanting = true
				#disable right arm
				RightArm.visible = false;
				#disable the grapple
		
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
