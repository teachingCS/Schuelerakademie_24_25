extends Node2D

@export var powerups : Array[Resource]

signal magnetize
signal bat_size

func _on_bricks_spawn_powerup(brick_pos) -> void:
	#print("powerup spawned at: " + str(brick_pos))
	var new_powerup = powerups.pick_random().instantiate()
	new_powerup.position = brick_pos
	add_child(new_powerup)

func clear_powerups():
	emit_signal("bat_size", 0)
	emit_signal("magnetize", false)
	get_tree().call_group("Balls", "magnetize", false)
	get_tree().call_group("Balls", "release")


func engage_magnets():
	clear_powerups()
	emit_signal("magnetize", true)
	get_tree().call_group("Balls", "magnetize", true)
	get_child(0).queue_free()
	# weitere Infos ausgeben

func big_bat():
	clear_powerups()
	emit_signal("bat_size", 1)
	
func small_bat():
	clear_powerups()
	emit_signal("bat_size", -1)
