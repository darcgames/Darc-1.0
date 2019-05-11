extends KinematicBody2D

export var speed = 300
var motion = Vector2()
func _physics_process(delta):
	randomize()
	motion.y = rand_range(0, speed)
	
	