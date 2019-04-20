extends KinematicBody2D

export var SPEED = 300
export var GRAVITY = 10
var motion = Vector2()

# TELLS THE SCENE WHAT DIRECTION IS UP, SO THE PLAYER CAN JUMP
const UP = Vector2(0, -1)

export var JUMP_HEIGHT = 400
#THIS INSTANCES THE FIREBALL SCENE CREATED
const FIREBALL = preload("res://SCENES/Fireball.tscn")
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
	
	# HANDLES WHAT HAPPENS WHEN THE SPACE KEY IS PUSHED
	# UI_SELECT IS THE SPACE KEY BY DEFAULT
	elif Input.is_action_just_pressed("ui_select"):
		
		# THE FIREBALL SCENE IS INSTANCED IN THIS SCRIPT INSTEAD OF THE
		# -MAIN EDITOR BECAUSE WE WANT IT TO BE ONLY CREATED/INSTANCED WHEN 
		# -THE PLAYER CLICKS ON THE INPUT WE DEFINED
		$player_sprite.play('punch')
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		# THIS SETS WHERE THE FIREBALL WILL APPEAR FROM
		fireball.position = $Position2D.global_position
	
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
	