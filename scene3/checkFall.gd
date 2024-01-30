extends Area2D

var caca = true
var passScene = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (caca):
		var node = get_node("../Player/AnimatedSprite2D")
		if(node.animation == "eau"):
			passScene = false
		else:
			var node_chut = get_node("../chutte")
			var node_scratch = get_node("../scratch")
			var node_sang = get_node("../sangSprite")
			body.visible = false
			node_sang.visible = true
			node_chut.play()
			node_scratch.play()
			get_tree().change_scene_to_file("res://menu.tscn")
			return
		caca = false
