extends CharacterBody2D

var speed = 600
var jump_height = -2000
var gravity = 6000
var responded = true

func _physics_process(delta):
	# Réinitialiser la vitesse horizontale
	if (responded == false):
		if Input.is_action_pressed("action_yes"):
			responded = true
		elif Input.is_action_pressed("action_no"):
			responded = true
			#tuer perso
		else:
			velocity.x = 0
			velocity.y += gravity * delta
			$AnimatedSprite2D.play("default")
			move_and_slide()
			if is_on_floor():
				velocity.y = 0
			return
	
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
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		if body.name == "scene1_StaticBody2D1":
			for child in (body.get_parent()).get_children():
				if child.name == "scene1_StaticBody2D3" || child.name == "scene1_StaticBody2D":
					child.visible = true
			body.visible = false
			for child in body.get_children():
				if child.name == "CollisionShape2D4":
					child.disabled = true
		if body.name == "scene1_StaticBody2D2" || body.name == "scene1_StaticBody2D5":
			body.visible = true
		#if body.name == "scene1_StaticBody2D":            #décommenter ceci après avoir implementer mort
			#tuer perso ici

	if is_on_floor():
		velocity.y = 0
