extends Node2D

func brick_hit(collision):
	$Bricks.brick_hit(collision.get_position(), collision.get_normal())
