extends CharacterBody2D

var speed = 600
var jump_height = -1500
var gravity = 6000
var on_echelle = false
var echelle_speed = 200
var speedtempo = true


func _physics_process(delta):
	velocity.x = 0

	# Mouvement horizontal standard
	if not on_echelle:
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			$AnimatedSprite2D.play("courir")
			var footstep = get_node("../footstep")
			if not footstep.playing:
				footstep.play()
			$AnimatedSprite2D.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			$AnimatedSprite2D.play("courir")
			var footstep = get_node("../footstep")
			if not footstep.playing:
				footstep.play()
			$AnimatedSprite2D.flip_h = true

		else:
			$AnimatedSprite2D.play("default")


		if Input.is_action_just_released("ui_left"):
			var footstep = get_node("../footstep")
			footstep.stop()
		if Input.is_action_just_released("ui_right"):
			var footstep = get_node("../footstep")
			footstep.stop()
		# Saut
		if is_on_floor() and Input.is_action_just_pressed("ui_up"):
			velocity.y = jump_height
			var pet = get_node("../pet")
			pet.play()
			
			
		if Input.is_action_pressed("action_o"):
			$AnimatedSprite2D.play("eau")

		# Appliquer la gravité
		velocity.y += gravity * delta

	else:
		# Mouvement sur l'échelle
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

		if Input.is_action_pressed("ui_up"):
			velocity.y = -echelle_speed
			$AnimatedSprite2D.play("courir")
		elif Input.is_action_pressed("ui_down"):
			velocity.y = echelle_speed
			$AnimatedSprite2D.play("courir")
		else:
			velocity.y = 0  # Reste immobile sur l'échelle
			$AnimatedSprite2D.stop()  # Arrête l'animation si nécessaire

	# Interaction spéciale
	if Input.is_action_pressed("action_f"):
		$AnimatedSprite2D.play("clope")

	# Déplacer le personnage
	move_and_slide()
