extends Label

onready var s = preload("res://SCENES/Coin_Collision.tscn")
var sig
var score = 0

func _ready():
	sig = s.instance()
	sig.connect("coin_taken", self, "on_coin_taken")
	
#func on_coin_taken():
#	score += 10
#	print(score)
	
