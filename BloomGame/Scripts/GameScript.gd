extends Node2D
class_name GameScript

#onready var RightArm = $Flora/FloraBody/RightArm
#onready var LeftArm = $Flora/FloraBody/LeftArm
#onready var RightLeg = $Flora/FloraBody/RightLeg
#onready var LeftLeg = $Flora/FloraBody/LeftLeg



var smallPlant = preload("res://Scenes/Plant.tscn")
export var test = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#call the grow function when they collide with the seed		
	
	
	#when u wana plant
	if(GlobalVariables.inPlantArea):
		# when they press Q
		if Input.is_action_just_pressed("PlantLeg"):
			print("CALLED PLANTLEG")
			#if the left leg is visible
			if(GlobalVariables.LeftLegOn):
				#test print
				print("IN THE IF")
				
				#call the plant function
				plant()
				#set the global isPlanting to true
				GlobalVariables.isPlanting = true
				#hide the left leg sprite
				GlobalVariables.LeftLegOn = false
				#disable double jump
				GlobalVariables.canDoubleJump = false
				
			else:
				#test print
				print("IN THE ELSE")
				#call the plant function
				plant()
				#turn on the isPlanting variable
				GlobalVariables.isPlanting = true
				#hide the right leg sprite
				GlobalVariables.RightLegOn = false
				#disable the jump
				GlobalVariables.canSingleJump = false
				
		#when they press E 
		if Input.is_action_just_pressed("PlantArm"):
			#if the arm is visible
			if(GlobalVariables.LeftArmOn):
				#test print
				print("PLANTED LEFT ARM")
				#call the plant function
				plant()
				#turn on the isPlanting
				GlobalVariables.isPlanting = true
				#toggle the visibility of the left arm
				GlobalVariables.LeftArmOn = false;
				#disable wall climb
				GlobalVariables.canClimb = false
			else:
				#call plant function
				plant()
				#turn on the variable
				GlobalVariables.isPlanting = true
				#disable right arm
				GlobalVariables.RightArmOn = false;
				#disable the grapple
				GlobalVariables.canGrapple = false

#this function is called whenever the character collides with the seedling
func Grow():
	#give jump first
	if(GlobalVariables.canSingleJump == false):
		#set the jump variable to true because its on
		GlobalVariables.canSingleJump = true;
		
		#call the animation of the limb growing back
		pass
		
	#then give back wall climb
	elif(GlobalVariables.canClimb == false):
		#set the jump variable to true because its on
		GlobalVariables.canClimb = true;
		
		#call the animation of the limb growing back
		pass
		
		
		
	#then give back double jump
	elif(GlobalVariables.canDoubleJump == false):
		#set the jump variable to true because its on
		GlobalVariables.canDoubleJump = true;
		
		#call the animation of the limb growing back
		pass
		
		
	#then give back grapple
	elif(GlobalVariables.canGrapple == false):
		#set the jump variable to true because its on
		GlobalVariables.canGrapple = true;
		
		#call the animation of the limb growing back
		pass

func plant():
	#get the position of the player to instance the node here
	var PlantInstance = smallPlant.instance()
	add_child(PlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	PlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted")
	
#when the player wants to spawn the plant
#instance the plant scene after button press
