extends KinematicBody2D

export var speed = 300
export var gravity = 10
var motion = Vector2()

# TELLS THE SCENE WHAT DIRECTION IS UP, SO THE PLAYER CAN JUMP
const UP = Vector2(0, -1)

var jump = 400

func _physics_process(delta):
	# ADDS GRAVITY TO THE PLAYER TO MAKE HIM FALL
	motion.y += gravity
	
	# HANDLES WHAT ACTION WILL OCCUR WHEN THE LEFT ARROW KEY IS PUSHED
	if Input.is_action_pressed('ui_left'):
		motion.x = -speed
		$Sprite.flip_h = true
		$Sprite.play("run")
	
	# HANDLES WHAT ACTION WILL OCCUR WHEN THE RIGHT ARROW KEY IS PUSHED
	elif Input.is_action_pressed('ui_right'):
		motion.x = speed
		$Sprite.flip_h = false
		$Sprite.play("run")
		
	# HANDLES WHAT ACTION WILL OCCUR WHEN NO KEY IS PUSHED
	else:
		motion.x = 0
		$Sprite.play("idle")
	
	# HANDLES WHAT HAPPENS WHEN THE PLAYER IS ON THE FLOOR
	if is_on_floor():
		
		# HANDLES WHAT HAPPENS WHEN THE PLAYER PUSHES THE UP BUTTON 
		if Input.is_action_just_pressed('ui_up'):
			motion.y = -jump
			
	# HANDLES WHAT HAPPENS WHEN THE PLAYER IS IN THE AIR
	else:
		$Sprite.play("land")
	
	motion = move_and_slide(motion, UP)
	