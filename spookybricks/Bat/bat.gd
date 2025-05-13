extends CharacterBody2D

const SPEED = 40

var motion := Vector2.ZERO
var first_shot := true
var size_integer:= 0


signal  fire_bolt

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_use_accumulated_input(false)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Fire"):
		fire()
		if first_shot:
			first_shot = false
			# tells the balls not to be magnets
			get_tree().call_group("Balls", "magnetize", false)
			get_tree().call_group("Balls", "release")
			# set magnet particles to false
			magnetize(false)
	move_and_collide(motion*SPEED*delta)
	motion.x = 0
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		motion.x += event.relative.x

func magnetize(set_magnet: bool):
	$Magnet.emitting = set_magnet
	

func fire():
	emit_signal("fire_bolt")

func _on_powerup_controller_magnetize() -> void:
	pass # Replace with function body.


func change_size(size: int):
	var new_scale: Vector2
	if size == size_integer:
		return
	match size:
		-1:
			new_scale = Vector2(0.75, 0.75)
		0:
			new_scale = Vector2(1,1)
		1:
			new_scale = Vector2(1.5, 1.5)
	size_integer = size
	var tween :=get_tree().create_tween()
	# Soundeffekt kommt noch
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "scale", new_scale, 0.5)
