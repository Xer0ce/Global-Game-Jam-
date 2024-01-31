extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_node("../Player")._dead()
	$TextureRect2.visible = true
	get_node("../Player").visible = false
	var audio_player = get_node("../AudioStreamPlayer2")
	if not audio_player.playing:
		audio_player.play()
		await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://menu.tscn")
	
