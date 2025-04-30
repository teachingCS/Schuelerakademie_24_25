extends Node2D

@export var powerups : Array[Resource]

func _on_bricks_spawn_powerup(brick_pos) -> void:
	#print("powerup spawned at: " + str(brick_pos))
	var new_powerup = powerups.pick_random().instantiate()
	new_powerup.position = brick_pos
	add_child(new_powerup)
