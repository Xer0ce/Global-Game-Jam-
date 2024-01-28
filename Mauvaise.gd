extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _disableCollision():
	$CollisionShape2D.set_deferred("disabled", true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	for child in get_parent().get_children():
		if (child.name == "couille"):
			if not child.playing:
				child.play()
				# IL FAUT LE FAIRE MOURIR ICI
