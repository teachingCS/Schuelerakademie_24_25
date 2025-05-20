extends "res://PowerUp/power_up.gd"


signal multiball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("multiball", get_parent().multiball)



func _on_body_entered(body: Node2D) -> void:
	call_deferred("emit_signal", "multiball")
	call_deferred("queue_free")
