extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play_random_music()
	

func play_random_music():
	if ( randi() % 2 ) == 0:
		stream = load("res://audio/music/overdose.ogg")
	else:
		stream = load("res://audio/music/nightdrive.ogg")
	play()


func play_titan_music():
	stream = load("res://audio/music/rumbling.mp3")
	play()

func stop_titan_music():
	play_random_music()


func _on_finished():
	play()
