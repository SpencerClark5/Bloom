extends WAT.Test

var _smallPlant = preload("res://Scenes/Plant.tscn")
#This sets name of test in the results view
func title()->String:
	return "Bloom Example Tests"
	
#ANY METHOD THAT STARTS WITH test_ is a test method

func test_for_Flora()->void:
	var _instanceNode = _smallPlant.instance()
	
	asserts.is_not_null(_instanceNode)
