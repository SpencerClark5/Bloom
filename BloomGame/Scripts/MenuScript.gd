extends Control


onready var _controlsScene = "res://Scenes/Controls.tscn"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	

func _on_Controls_pressed():
	get_tree().chagne_scene("res://Scenes/Controls.tscn")


func _on_Quit_pressed():
	get_tree().quit()
