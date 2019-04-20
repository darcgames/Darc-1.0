extends Area2D

func _ready():
	$Coin_collision.play('spin')

func _on_Coin_Collision_body_entered(body):
	if body.get_name() == "player":
		queue_free()
		