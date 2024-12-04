extends Node2D

# Die Obstacle-Szenen Datei wird am Anfang geladen.
const OBSTACLE = preload("res://obstacle.tscn")

func _on_spawn_timer_timeout() -> void:
	# Erzeugen einer Instanz/ eines Objekts der Obstacleszene
	var current_obstacle = OBSTACLE.instantiate()
	
	# Eine Möglichkeit das Objekt an die richtige Position zu setzen
	# current_obstacle.position = Vector2(1350, 400)
	
	# Dem Level-Node wird das Objekt current_obstacle hinzugefügt
	add_child(current_obstacle)
