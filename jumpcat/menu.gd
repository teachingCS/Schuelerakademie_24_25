extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("space-pressed"):
		get_tree().change_scene_to_file("res://level.tscn")
