extends KinematicBody2D

export var SPEED = 300
export var GRAVITY = 10
var motion = Vector2()

# TELLS THE SCENE WHAT DIRECTION IS UP, SO THE PLAYER CAN JUMP
const UP = Vector2(0, -1)

export var JUMP_HEIGHT = 400

func _physics_process(delta):
	# ADDS GRAVITY TO THE PLAYER TO MAKE HIM FALL
	motion.y += GRAVITY
	
	# HANDLES WHAT ACTION WILL OCCUR WHEN THE LEFT ARROW KEY IS PUSHED
	if Input.is_action_pressed('ui_left'):
		motion.x = -SPEED
		$player_sprite.flip_h = true
		$player_sprite.play("run")
	
	# HANDLES WHAT ACTION WILL OCCUR WHEN THE RIGHT ARROW KEY IS PUSHED
	elif Input.is_action_pressed('ui_right'):
		motion.x = SPEED
		$player_sprite.flip_h = false
		$player_sprite.play("run")
	
	# HANDLES WHAT ACTION WILL OCCUR WHEN NO KEY IS PUSHED
	else:
		motion.x = 0
		$player_sprite.play("idle")
	
	# HANDLES WHAT HAPPENS WHEN THE PLAYER IS ON THE FLOOR
	if is_on_floor():
		
		# HANDLES WHAT HAPPENS WHEN THE PLAYER PUSHES THE UP BUTTON 
		if Input.is_action_just_pressed('ui_up'):
			motion.y = -JUMP_HEIGHT
	else:
		$player_sprite.play('jump')
			
	
	
	motion = move_and_slide(motion, UP)
	