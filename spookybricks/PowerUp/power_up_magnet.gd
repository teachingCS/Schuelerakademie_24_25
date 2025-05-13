extends "res://PowerUp/power_up.gd"

signal magnetize

func _ready():
	connect("magnetize", get_parent().engage_magnets)



func _on_body_entered(body: Node2D) -> void:
	call_deferred("emit_signal", "magnetize")
	call_deferred("queue_free")
