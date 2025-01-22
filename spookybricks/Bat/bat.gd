extends CharacterBody2D

const SPEED = 40

var motion := Vector2.ZERO

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_use_accumulated_input(false)

func _physics_process(delta: float) -> void:
	move_and_collide(motion*SPEED*delta)
	motion.x = 0
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		motion.x += event.relative.x
