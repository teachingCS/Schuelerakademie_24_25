extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HighscoreLabel.text = "Highscore: " + str(GameState.highscore)


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("space-pressed"):
		get_tree().change_scene_to_file("res://level.tscn")
