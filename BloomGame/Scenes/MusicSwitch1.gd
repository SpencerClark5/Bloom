extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var looping_music = get_parent().get_node("Flora/LoopingBackground")
onready var _flora = get_parent().get_node("Flora")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MusicSwitch1_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("in switch")
	var level_2_music = AudioStreamPlayer.new()
	level_2_music.stream = load("res://Music/hopeLOOP_Undergrowth_4-21-22_Bloom.wav")
	_flora.add_child(level_2_music)
	looping_music.stop()
	looping_music.queue_free()
	if not (level_2_music.is_playing()):
		level_2_music.volume_db = -24
		level_2_music.play()
