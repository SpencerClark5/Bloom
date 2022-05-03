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
	
	if(GlobalVariables.inBigPlantArea && GlobalVariables.timesPlanted < 5):
		
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
				
				if(GlobalVariables.firstLimb == "null"):
					GlobalVariables.firstLimb = "Leg"
				elif(GlobalVariables.firstLimb == "Arm" && GlobalVariables.secondLimb != "Arm"):
					GlobalVariables.secondLimb = "Leg"
				else:
					GlobalVariables.thirdLimb = "Leg"
				
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
				
				if(GlobalVariables.firstLimb != "null" && GlobalVariables.secondLimb == "null"):
					GlobalVariables.secondLimb = "Leg"
				elif(GlobalVariables.secondLimb != "null" && GlobalVariables.thirdLimb == "null"):
					GlobalVariables.thirdLimb = "Leg"
				else:
					GlobalVariables.fourthLimb = "Leg"
		
		
		
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
				GlobalVariables.canGrapple = false
				canClimb = false
				
				if(GlobalVariables.firstLimb == "null"):
					GlobalVariables.firstLimb = "Arm"
				elif(GlobalVariables.firstLimb == "Leg" && GlobalVariables.secondLimb != "Leg"):
					GlobalVariables.secondLimb = "Arm"
				else:
					GlobalVariables.thirdLimb = "Arm"
				
			else:
				#call plant function
				BigPlant()
				#turn on the variable
				GlobalVariables.isPlanting = true
				#disable right arm
				GlobalVariables.RightArmOn = false;
				#disable the grapple
				GlobalVariables.canClimb = false
				canGrapple = false
				
				if(GlobalVariables.firstLimb != "null" && GlobalVariables.secondLimb == "null"):
					GlobalVariables.secondLimb = "Arm"
				elif(GlobalVariables.secondLimb != "null" && GlobalVariables.thirdLimb == "null"):
					GlobalVariables.thirdLimb = "Arm"
				else:
					GlobalVariables.fourthLimb = "Arm"


	#when u wana plant
	elif(GlobalVariables.inPlantArea && GlobalVariables.timesPlanted < 5):
		if Input.is_action_just_pressed("PlantLeg"):
			
			if(GlobalVariables.LeftLegOn):
				plant()
				#set the global isPlanting to true
				GlobalVariables.isPlanting = true
				#hide the left leg sprite
				GlobalVariables.LeftLegOn = false
				#disable double jump
				GlobalVariables.canDoubleJump = false
				canDoubleJump = false
				
				if(GlobalVariables.firstLimb == "null"):
					GlobalVariables.firstLimb = "Leg"
				elif(GlobalVariables.firstLimb == "Arm" && GlobalVariables.secondLimb != "Arm"):
					GlobalVariables.secondLimb = "Leg"
				else:
					GlobalVariables.thirdLimb = "Leg"
				
			else:
				#test print
				#print("IN THE ELSE")
				#call the plant function
				plant()
				#turn on the isPlanting variable
				GlobalVariables.isPlanting = true
				#hide the right leg sprite
				GlobalVariables.RightLegOn = false
				#disable the jump
				GlobalVariables.canSingleJump = false
				canJump = false
				
				if(GlobalVariables.firstLimb != "null" && GlobalVariables.secondLimb == "null"):
					GlobalVariables.secondLimb = "Leg"
				elif(GlobalVariables.secondLimb != "null" && GlobalVariables.thirdLimb == "null"):
					GlobalVariables.thirdLimb = "Leg"
				else:
					GlobalVariables.fourthLimb = "Leg"
		
		
		
				#when they press E 
		if Input.is_action_just_pressed("PlantArm"):
			
			#if the arm is visible
			if(GlobalVariables.LeftArmOn):
				#test print
				#print("PLANTED LEFT ARM")
				#call the plant function
				plant()
				#turn on the isPlanting
				GlobalVariables.isPlanting = true
				#toggle the visibility of the left arm
				GlobalVariables.LeftArmOn = false;
				#disable wall climb
				GlobalVariables.canGrapple = false
				canClimb = false
				
				if(GlobalVariables.firstLimb == "null"):
					GlobalVariables.firstLimb = "Arm"
				elif(GlobalVariables.firstLimb == "Leg" && GlobalVariables.secondLimb != "Leg"):
					GlobalVariables.secondLimb = "Arm"
				else:
					GlobalVariables.thirdLimb = "Arm"
				
			else:
				#call plant function
				plant()
				#turn on the variable
				GlobalVariables.isPlanting = true
				#disable right arm
				GlobalVariables.RightArmOn = false;
				#disable the grapple
				GlobalVariables.canClimb = false
				canGrapple = false
				
				if(GlobalVariables.firstLimb != "null" && GlobalVariables.secondLimb == "null"):
					GlobalVariables.secondLimb = "Arm"
				elif(GlobalVariables.secondLimb != "null" && GlobalVariables.thirdLimb == "null"):
					GlobalVariables.thirdLimb = "Arm"
				else:
					GlobalVariables.fourthLimb = "Arm"



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
	GlobalVariables.timesPlanted += 1

func BigPlant():
	#get the position of the player to instance the node here
	var BigPlantInstance = _bigPlant.instance()
	add_child(BigPlantInstance)
	#gets the flora node and then gets the KinematicBody2D and grabs the global position of that
	BigPlantInstance.global_position = get_node("Flora").get_child(0).get_global_position()
	print("planted big boy")
	GlobalVariables.timesPlanted += 1


func _on_BackgroundMusic_finished():
	$Flora/LoopingBackground.play()


