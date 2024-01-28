extends Area2D

var ontTime = true

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_body_entered(body):
	if (ontTime):
		ontTime = false


func _on_body_exited(body):
	body.rotation_degrees += 90
