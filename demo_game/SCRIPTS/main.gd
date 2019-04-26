extends Node

onready var label = get_node('CanvasLayer/Control/Label')
var score = 0

func _ready():
	
	get_child(2).connect('coin_taken', self, "coin")
	
func coin():
	score += 10
	label.text = str(score)
	