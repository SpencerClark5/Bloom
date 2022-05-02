extends Area2D
onready var _flora = get_parent().get_node("Flora")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MusicSwitch4_body_entered(body):
	if(GlobalVariables.canPlay2):
		print("in switch")
		var level_3_music = AudioStreamPlayer.new()
		level_3_music.stream = load("res://Music/hopeLOOP_Rise_4-21-22_Bloom.wav")
		_flora.add_child(level_3_music)
		if not (level_3_music.is_playing()):
			level_3_music.volume_db = -24
			level_3_music.play()
		GlobalVariables.canPlay2 = false


func _on_MusicSwitch4_body_exited(body):
	self.queue_free()
