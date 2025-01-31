extends Area2D

var speed : int = 12
var style = ["couch", "family", "kittens"]

func _ready() -> void:
	$AnimatedSprite2D.animation = style.pick_random()

func _physics_process(delta: float):
	position.x = position.x - speed


func _on_body_entered(body: Node2D) -> void:
	# Hier ist das Spiel beendet:
	get_tree().change_scene_to_file("res://menu.tscn")
	GameState.gameover()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
