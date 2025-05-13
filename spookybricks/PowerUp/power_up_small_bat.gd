extends "res://PowerUp/power_up.gd"


signal small_bat

func _ready():
	connect("small_bat", get_parent().small_bat)



func _on_body_entered(body: Node2D) -> void:
	call_deferred("emit_signal", "small_bat")
	call_deferred("queue_free")
