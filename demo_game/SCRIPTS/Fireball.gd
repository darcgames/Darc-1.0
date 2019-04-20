extends Area2D

export var SPEED = 600
var motion = Vector2()

func _ready():
    # THIS MAKES SURE THE ANIMATION PLAYS WHEN THE SCENE PLAYS
	$AnimatedSprite.play("fire")

# MAKES THE FIREBALL MOVE IN A SPECIFIC DIRECTION
func _physics_process(delta):
	# "delta" WAS USED BECAUSE THE MOVE AND SLIDE MOTION WAS NOT USED
	motion.x = SPEED * delta
	
	translate(motion)
# THIS SIGNAL FUNCTION HANDLES WHAT HAPPENS TO THE FIREBALL AFTER IT LEAVES THE SCREEN
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()