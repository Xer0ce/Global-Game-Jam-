extends CharacterBody2D

var speed = 600
var jump_height = -2000
var gravity = 6000
var responded = true

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
	if is_on_floor() and Input.is_action_pressed("action_q"):
		$AnimatedSprite2D.play("chaise keshua")
	else:
		move_and_slide()
	
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		if body.name == "PMUdehors":
			get_node("../PMUdehors/CollisionShape2D5").disabled = true

	if is_on_floor():
		velocity.y = 0
