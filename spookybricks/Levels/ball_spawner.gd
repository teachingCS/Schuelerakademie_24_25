extends Node2D

const MAX_BALL_COUNT = 9
var ball = preload("res://Ball/ball.tscn")

func _on_child_entered_tree(child):
	child.connect("brick_hit", get_parent().brick_hit)


func _on_child_exiting_tree(_child):
	if get_child_count() - 1 < 1:
		get_tree().quit()


func _on_powerup_controller_spawn_multiball() -> void:
	var number_of_balls = get_child_count()
	var number_of_balls_to_spawn = 2
	
	if number_of_balls + number_of_balls_to_spawn > MAX_BALL_COUNT:
		number_of_balls_to_spawn = MAX_BALL_COUNT - number_of_balls
	
	if number_of_balls_to_spawn == 0:
		return
	
	for i in number_of_balls_to_spawn:
		var child = get_child(i)
		var new_ball = ball.instantiate()
		new_ball.velocity = child.velocity + Vector2(500,0)
		new_ball.position = child.position + Vector2(64,0)
		
		add_child(new_ball)
		new_ball.magnetized = false
