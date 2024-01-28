extends Area2D

var caca = true

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
			print ("zob")
		#else:
			# IL FAUT LE FAIRE MOURIR ICI
		caca = false
