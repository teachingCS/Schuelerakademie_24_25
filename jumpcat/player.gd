extends CharacterBody2D



const JUMP_VELOCITY = -700.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity += get_gravity() * delta
	else:
		$AnimatedSprite2D.play("walk")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer.play()


	move_and_slide()
