extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var looping_music = get_parent().get_node("Flora/LoopingBackground")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MusicSwitch1_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	var level_2_music = AudioStreamPlayer.new()
	level_2_music.stream = load("res://Music/hopeLOOP_Undergrowth_4-21-22_Bloom.wav")
	looping_music.stop()
	if not (level_2_music.is_playing()):
		level_2_music.play()
