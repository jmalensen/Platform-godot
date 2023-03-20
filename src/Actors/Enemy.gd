extends Actor

func _ready() -> void:
	velocity.x = -speed.x

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	move_and_slide()
	#move_and_collide(velocity)
