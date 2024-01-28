extends CharacterBody2D

var speed = 600
var jump_height = -2000
var gravity = 6000
var touch_top

func _ready():
	touch_top = false
	pass

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
	
	for index in get_slide_collision_count():
		var collision := get_slide_collision(index)
		var body := collision.get_collider()
		if body.name == "Fake_Plateform":
			body.visible = false
			for child in body.get_children():
				if child.name == "CollisionShape2D":
					child.disabled = true
					touch_top = true
		if body.name == "Unicorn":
			# kill player
			for child in body.get_children():
				if child.name == "AnimatedSprite2D":
					child.play("killed_player")
		if body.name == "Spikes":
			# kill player
			pass
	var invisible = get_node("../Invisible_Floor/CollisionShape2D")
	if (touch_top == true):
		invisible.disabled = true
	if is_on_floor():
		velocity.y = 0
