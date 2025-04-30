extends Area2D

class_name Powerup

func _physics_process(delta):
	position.y += 250 * delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
