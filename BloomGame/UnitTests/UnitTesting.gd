extends WAT.Test

onready var node
#This sets name of test in the results view
func title()->String:
	return "Bloom Example Tests"
	
#ANY METHOD THAT STARTS WITH test_ is a test method

func test_for_Flora()->void:
	
	#can use describe to show this string instead of the method name in the results view
	describe("Bloom Example Test")
	#node.get_node("Flora")
	asserts.auto_pass()
