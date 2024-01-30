extends CharacterBody2D

var speed = 600
var jump_height = -2000
var gravity = 6000
var chairTime = 0
var ElapsedTime = 0
var car = true
var responded = true

func _physics_process(delta):
	# Réinitialiser la vitesse horizontale
	velocity.x = 0
	
	if (visible == false):
		get_tree().change_scene_to_file("res://menu.tscn")
		OS.delay_msec(1000)
		return

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
	ElapsedTime += delta
	if (ElapsedTime >= 10 && chairTime < 4 && car == true):
		var voiture = get_node("../scene6_StaticBody2D2")
		if voiture.get_position().x < 2050:
			voiture.translate(Vector2(speed * 2 * delta, 0))
			velocity.x = 0
			if (velocity.y < 0):
				velocity.y = 0
		else:
			visible = false
			get_node("../TextureRect").visible = true
	elif (chairTime >= 4):
		var wall = get_node("../scene6_StaticBody2D")
		wall.translate(Vector2(0, -speed * delta))
		car = false
	velocity.y += gravity * delta

	# Déplacer le personnage en utilisant la méthode intégrée de CharacterBody2D
	if !(ElapsedTime >= 10 && chairTime < 4 && car == true) and is_on_floor() and Input.is_action_pressed("action_q"):
		chairTime += delta
		$AnimatedSprite2D.play("chaise keshua")
	else:
		chairTime = 0
		move_and_slide()


	if is_on_floor():
		velocity.y = 0
