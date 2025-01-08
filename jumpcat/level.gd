extends Node2D

# Die Obstacle-Szenen Datei wird am Anfang geladen.
const OBSTACLE = preload("res://obstacle.tscn")
# Die Variable score wird im Levelskript nicht mehr benötigt (GameState)
# var score : int

func _on_spawn_timer_timeout() -> void:
	# Erzeugen einer Instanz/ eines Objekts der Obstacleszene
	var current_obstacle = OBSTACLE.instantiate()
	# Nicht jedes Obstacle ist gleich schnell:
	current_obstacle.speed = randi_range(8, 16)
	# Dem Level-Node wird das Objekt current_obstacle hinzugefügt
	add_child(current_obstacle)
	# Abstand zum nächsten Spawnzeitpunkt soll variieren:
	$SpawnTimer.wait_time = randf_range(1.8,3.0)


func _on_score_timer_timeout() -> void:
	# Score wird um eins erhöht
	GameState.current_score = GameState.current_score + 1
	# Aktualisiere das ScoreLabel:
	$ScoreLabel.text = "Score: " + str(GameState.current_score)
