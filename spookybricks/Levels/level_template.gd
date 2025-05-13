extends Node2D

func brick_hit(collision):
	$Bricks.brick_hit(collision.get_position(), collision.get_normal())


func _on_bat_fire_bolt() -> void:
	get_tree().call_group("Balls", "release")
