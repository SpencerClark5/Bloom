extends WAT.Test


#This sets name of test in the results view
func title()->String:
	return "Bloom Example Tests"
	
#ANY METHOD THAT STARTS WITH test_ is a test method

func test_simple_example()->void:
	
	#can use describe to show this string instead of the method name in the results view
	describe("Bloom Example Test")
	
	asserts.is_true(true)
