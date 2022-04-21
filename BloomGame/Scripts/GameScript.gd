extends Node2D
class_name GameScript

#onready var RightArm = $Flora/FloraBody/RightArm
#onready var LeftArm = $Flora/FloraBody/LeftArm
#onready var RightLeg = $Flora/FloraBody/RightLeg
#onready var LeftLeg = $Flora/FloraBody/LeftLeg

onready var _backgroundMusic = $Flora/BackgroundMusic

var _smallPlant = preload("res://Scenes/Plant.tscn")
var _bigPlant = preload("res://Scenes/BigPlant.tscn")

#ignore these, for testing
export var canJump = true
export var canDoubleJump = true
export var canClimb = true
export var canGrapple = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if(GlobalVariables.inBigPlantArea):
		
		if Input.is_action_just_pressed("PlantLeg"):
			
			if(GlobalVariables.LeftLegOn):
				BigPlant()
				#set the global isPlanting to true
				GlobalVariables.isPlanting = true
				#hide the left leg sprite
				GlobalVariables.LeftLegOn = false
				#disable double jump
				GlobalVariables.canDoubleJump = false
				canDoubleJump = false
				
			else:
				#test print
				#print("IN THE ELSE")
				#call the plant function
				BigPlant()
				#turn on the isPlanting variable
				GlobalVariables.isPlanting = true
				#hide the right leg sprite
				GlobalVariables.RightLegOn = false
				#disable the jump
				GlobalVariables.canSingleJump = false
				canJump = false
		
		
		
				#when they press E 
		if Input.is_action_just_pressed("PlantArm"):
			#if the arm is visible
			if(GlobalVariables.LeftArmOn):
				#test print
				#print("PLANTED LEFT ARM")
				#call the plant function
				BigPlant()
				#turn on the isPlanting
				GlobalVariables.isPlanting = true
				#toggle the visibility of the left arm
				GlobalVariables.LeftArmOn = false;
				#disable wall climb
				GlobalVariables.canClimb = false
				canClimb = false
			else:
				#call plant function
				BigPlant()
				#turn on the variable
				GlobalVariables.isPlanting = true
				#disable right arm
				GlobalVariables.RightArmOn = false;
				#disable the grapple
				GlobalVariables.canGrapple = false
				canGrapple = false

	
				#disable the grapple
				GlobalVariables.canGrapple = false






	#when u wana plant
	if(GlobalVariables.inPlantArea):
		# when they press Q
		if Input.is_action_just_pressed("PlantLeg"):
			print("CALLED PLANTLEG")
			#print("CALLED PLANTLEG")
			#if the left leg is visible
			if(GlobalVariables.LeftLegOn):
				#test print
				print("IN THE IF")
				#print("IN THE IF")
				
				#call the plant function
				plant()
				
			else:
				#test print
				print("IN THE ELSE")
				#print("IN THE ELSE")
				#call the plant function
				plant()
				#turn on the isPlanting variable
				GlobalVariables.isPlanting = true;
			#if the arm is visible
			if(GlobalVariables.LeftArmOn):
				#test print
				print("PLANTED LEFT ARM")
				#print("PLANTED LEFT ARM")
				#call the plant function
				plant()
				#turn on the isPlanting
				GlobalVariables.isPlanting=true;
				#disable the grapple
				GlobalVariables.canGrapple = false



#this function is called whenever the character collides with the seedling
func Grow():
	#give jump first
	if(GlobalVariables.canSingleJump == false):
		#set the jump variable to true because its on
		GlobalVariables.canSingleJump = true;
		canJump = true
		
		#call the animation of the limb growing back
		pass
		
	#then give back wall climb
	elif(GlobalVariables.canClimb == false):
		#set the jump variable to true because its on
		GlobalVariables.canClimb = true;
		canClimb = true
		
		#call the animation of the limb growing back
		pass
		
		
		
	#then give back double jump
	elif(GlobalVariables.canDoubleJump == false):
		#set the jump variable to true because its on
		GlobalVariables.canDoubleJump = true;
		canDoubleJump = true
		
		#call the animation of the limb growing back
		pass
		
		
	#then give back grapple
	elif(GlobalVariables.canGrapple == false):
		#set the jump variable to true because its on
		GlobalVariables.canGrapple = true;
		canGrapple = true
		
		#call the animation of the limb growing back
		pass

func plant():
	#get the position of the player to instance the node here
	var PlantInstance = _smallPlant.instance()
	add_child(PlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	PlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted")

func BigPlant():
	#get the position of the player to instance the node here
	var BigPlantInstance = _bigPlant.instance()
	add_child(BigPlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	BigPlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted big boy")


func _on_BackgroundMusic_finished():
	$Flora/LoopingBackground.play()
