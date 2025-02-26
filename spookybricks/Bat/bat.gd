extends CharacterBody2D

const SPEED = 40

var motion := Vector2.ZERO
var first_shot := true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_use_accumulated_input(false)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Fire"):
		if first_shot:
			first_shot = false
			# tells the balls not to be magnets
			get_tree().call_group("Balls", "hi")
			get_tree().call_group("Balls", "magnetize", false)
			get_tree().call_group("Balls", "release")
			# set magnet particles to false
	move_and_collide(motion*SPEED*delta)
	motion.x = 0
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		motion.x += event.relative.x
