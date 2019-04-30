extends Area2D
signal coin_taken
onready var child = get_node("Coin_collision")
var score = 0
#onready var p=preload("res://SCENES/main.tscn")
func _physics_process(delta):
	$Coin_collision.play('spin')

