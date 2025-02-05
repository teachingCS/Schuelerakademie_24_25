extends CharacterBody2D

const SPEED = 1000

signal brick_hit

func _ready() -> void:
	velocity.y = -SPEED
	max_slides = 1

func _physics_process(delta: float) -> void:
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
	
