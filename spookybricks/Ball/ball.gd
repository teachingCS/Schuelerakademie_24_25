extends CharacterBody2D

const SPEED = 1000

signal brick_hit

var Bat : CharacterBody2D

var magnetized := true
var grabbed := false
var grab_offset := 0.0

func _ready() -> void:
	velocity.y = -SPEED
	max_slides = 1

func _physics_process(delta: float) -> void:
	if grabbed and Bat:
		velocity = Vector2.ZERO
		position.x = Bat.position.x + grab_offset
	
	$Sprite2D.rotation += deg_to_rad(velocity.x /100)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		# print(collision)
		var collider = collision.get_collider()
		# print(collider)
		if collider != null:
			var reflection = velocity.reflect(collision.get_normal()).normalized()
			velocity = -reflection * SPEED
			
			if collider.name == "Bat":
				deflect_from_bat(collider)
			
			if collider is TileMapLayer:
				# Signal soll ausgesendet werden
				# Spiele coolen Sound ab
				pass
				
				
func deflect_from_bat(collider):
	var distance_to_center = position.x - collider.position.x
	velocity.x += distance_to_center * 5
	if velocity.y > 0:
		velocity.y *= -1
	


func _on_magnet_area_body_entered(body: Node2D) -> void:
	if magnetized:
		Bat = body
		grab_offset = position.x - Bat.position.x
		grabbed = true

func magnetize(set_magnet:bool):
	print("test")
	magnetized = set_magnet
	
func release():
	if grabbed:
		grabbed = false
		velocity.y = -SPEED
		velocity.x += grab_offset * 5
