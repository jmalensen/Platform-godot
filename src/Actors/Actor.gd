extends CharacterBody2D
class_name Actor

@export var gravity: = 3000.0
@export var speed: = Vector2(300.0, 1000.0)

#func _physics_process(delta: float) -> void:
	
	#velocity.y = max(velocity.y, speed.y)
	#velocity.x = Input.get_axis("ui_up", "ui_down") * transform.basis.z * speed
#	move_and_slide()
