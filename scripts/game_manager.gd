extends Node

var score = 0
@onready var scorelabeled: Label = $scorelabeled

func add_point():
	score += 1
	scorelabeled.text = 'You collected' + str(score) + "$."
