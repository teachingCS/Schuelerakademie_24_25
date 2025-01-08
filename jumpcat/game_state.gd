extends Node

var current_score : int = 0
var highscore : int = 0


func gameover():
	# Überprüfe ob ein neuer Highscore erreicht wurde
	if current_score > highscore:
		highscore = current_score
	# current_score für das nächste Spiel zurücksetzen:
	current_score = 0
