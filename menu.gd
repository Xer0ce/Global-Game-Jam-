extends Control

func _ready():

	# Définir la texture du bouton
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene1/Scene1.tscn")
	
func _on_settinngs_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
