extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if Input.is_action_just_pressed("action_f"):
		var audio_player = get_node("../smoke")  # Assurez-vous que ce chemin correspond à votre AudioStreamPlayer
		if not audio_player.playing:
			audio_player.play()
