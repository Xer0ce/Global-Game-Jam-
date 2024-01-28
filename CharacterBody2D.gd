extends CharacterBody2D

var speed = 600
var jump_height = -1500
var gravity = 6000

func _physics_process(delta):
	# Réinitialiser la vitesse horizontale
	velocity.x = 0

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite2D.play("courir")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite2D.play("courir")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("default")

	if Input.is_action_pressed("action_f"):
		$AnimatedSprite2D.play("clope")

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_height

	# Appliquer la gravité
	velocity.y += gravity * delta

	# Déplacer le personnage en utilisant la méthode intégrée de CharacterBody2D
	move_and_slide()

	if is_on_floor():
		velocity.y = 0
