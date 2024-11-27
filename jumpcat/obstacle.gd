extends Area2D

var speed : int = 4

func _physics_process(delta: float):
	position.x = position.x - speed


func _on_body_entered(body: Node2D) -> void:
	get_tree().quit()
