extends Node2D


func _on_child_entered_tree(child):
	child.connect("brick_hit", get_parent().brick_hit)


func _on_child_exiting_tree(_child):
	if get_child_count() - 1 < 1:
		get_tree().quit()
