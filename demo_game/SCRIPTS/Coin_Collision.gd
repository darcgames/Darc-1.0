extends Area2D
signal coin_taken
onready var child = get_node("Coin_collision")
var score = 0
#onready var p=preload("res://SCENES/main.tscn")
func _physics_process(delta):
	$Coin_collision.play('spin')

func _on_Coin_Collision_body_entered(body):
	if body.get_name() == "player":
		emit_signal("coin_taken")
		queue_free()
	

