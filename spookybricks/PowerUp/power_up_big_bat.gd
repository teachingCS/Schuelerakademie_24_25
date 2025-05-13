extends "res://PowerUp/power_up.gd"

signal big_bat

func _ready():
	connect("big_bat", get_parent().big_bat)



func _on_body_entered(body: Node2D) -> void:
	call_deferred("emit_signal", "big_bat")
	call_deferred("queue_free")
