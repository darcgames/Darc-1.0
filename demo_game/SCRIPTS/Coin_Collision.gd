extends Area2D

onready var tween = get_node('Tween')
onready var child = get_node("Coin_collision")

func _physics_process(delta):
	$Coin_collision.play('spin')
	
func _on_Coin_Collision_body_entered(body):
	if body.get_name() == "player":
		pass
	
