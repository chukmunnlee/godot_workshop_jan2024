extends Node

signal on_score_updated(score: int)

var score: int = 0

func add_to_score(points: int) -> void:
	score += points 
	on_score_updated.emit(score)
