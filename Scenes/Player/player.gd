extends CharacterBody2D

const SPEED = 200.0
const ACCELERATION = 1000.0
const FRICTION = 1200.0

@export var inv: Inv


func _physics_process(delta):
	var direction = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()

func collect(item):
	inv.insert(item)
