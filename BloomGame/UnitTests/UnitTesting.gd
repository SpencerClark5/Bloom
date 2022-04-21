extends WAT.Test
#Variables being used
var _smallPlant = preload("res://Scenes/Plant.tscn")
var _testFlora = preload("res://Scenes/Flora.tscn")
var _game = preload("res://Scenes/Game.tscn")
var _gameScript = preload("res://Scripts/GameScript.gd")



#This sets name of test in the results view
func title()->String:
	return "Bloom Example Tests"
	
#ANY METHOD THAT STARTS WITH test_ is a test method

#test that flora is not null
func test_for_Flora()->void:
	var _instanceFlora = _testFlora.instance()
	asserts.is_not_null(_testFlora)
	

#Testing that plant is being called and that the instance is not null
func test_for_plant()->void:
	
	var scene = direct.scene(_game)
	var double = scene.double()
	asserts.is_class_instance(double, GameScript)
	var gameInstance = double
	
	gameInstance.plant()
	yield(until_timeout(1), YIELD)
	asserts.is_not_null(gameInstance.get_node("PlantRoot"))
	
#Test for the big plant
func test_for_Bigplant()->void:
	
	var scene = direct.scene(_game)
	var double = scene.double()
	asserts.is_class_instance(double, GameScript)
	var gameInstance = double
	
	gameInstance.BigPlant()
	yield(until_timeout(1), YIELD)
	asserts.is_not_null(gameInstance.get_node("BigPlant"))
	
#Testing that wall climb turns off
func test_wall_climb_off()->void:
	
	var scene = direct.scene(_game)
	var double = scene.double()
	var gameInstance = double
	
	GlobalVariables.inPlantArea = true
	GlobalVariables.LeftArmOn = true
	var a = InputEventAction.new()
	a.action = "PlantArm"
	a.pressed = true
	Input.parse_input_event(a)
	
	asserts.is_false(GlobalVariables.canClimb)
	
#Test that grow turns back on single jump
func test_grow_jumpOn()->void:
	var scene = direct.scene(_game)
	var double = scene.double()
	var gameInstance = double
	
	gameInstance.Grow()
	asserts.is_true(gameInstance.canJump)
	
#Test that grow turns back on double jump
func test_grow_doubleJumpOn()->void:
	var scene = direct.scene(_game)
	var double = scene.double()
	var gameInstance = double
	
	gameInstance.Grow()
	asserts.is_true(gameInstance.canDoubleJump)
	
	
	
