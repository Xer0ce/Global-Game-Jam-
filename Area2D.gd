extends Area2D

var animated_sprite : AnimatedSprite2D

var default_animation : String = "default"
var boots_animation : String = "bottes"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$bottes.visible = false
	get_node("../Player")._bottes()
	get_node("../Player").jump_height = -9000
