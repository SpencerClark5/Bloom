extends WAT.Test
#Variables being used
var _smallPlant = preload("res://Scenes/Plant.tscn")
var _testFlora = preload("res://Scenes/Flora.tscn")
var _game = preload("res://Scenes/Game.tscn")
#This sets name of test in the results view
func title()->String:
	return "Bloom Example Tests"
	
#func start() ->void:
	#var _smallPlant = preload("res://Scenes/Plant.tscn")
	#var _testFlora = preload("res://Scenes/Flora.tscn")
	
#ANY METHOD THAT STARTS WITH test_ is a test method

#tests that a plant is not null
func test_for_Plant()->void:
	_smallPlant.instance()
	asserts.is_not_null(_smallPlant)

#test that flora is not null
func test_for_Flora()->void:
	_testFlora.instance()
	asserts.is_not_null(_testFlora)
	
func test_for_Function_Call()->void:
	_game.instance()
	Input.action_press("Plant")
	asserts.was_called(_game.Plant(), "was Called")
	
