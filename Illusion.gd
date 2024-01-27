extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _turnInvisible():
	for child in get_children():
		if child.has_method("disable"):
			child.disable()
		if child.has_method("_turnVisible"):
			child._turnVisible()
		if child.has_method("_turnInvisible"):
			child._turnInvisible()
	pass
