extends Actor

@export var stomp_impulse: = 1000.0

func _on_enemy_detector_area_entered(area: Area2D) -> void:
	velocity = calculate_stomp_velocity(stomp_impulse)
	
func _on_enemy_detector_body_entered(body: Node2D) -> void:
	queue_free()
	
func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)
	move_and_slide()

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	
	var out:= linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
		
	if is_jump_interrupted:
		out.y = 0.0
		
	return out

func calculate_stomp_velocity(impulse:float) -> Vector2:
	var out: = velocity
	#out.y = -impulse
	return out
