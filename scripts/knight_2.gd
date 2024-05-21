extends CharacterBody2D

const max_speed = 400
var deceleration = 1000
const accel = 1000
const friction = 600
var speed = 250

var input = Vector2.ZERO

const UP = Vector2(0,-1)
var motion = Vector2()

# New
const gravity = 15
const jump_speed = -300

@onready var anim = $AnimatedSprite2D

# This seems to be used as a boundry for the game window.
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport().size

func _physics_process(delta):
	set_velocity(motion)
	set_up_direction(UP)
	#get_input()
	get_input(delta)
	#player_movement(delta)
	move_and_slide()
	

func get_input(delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# Test
	# https://www.youtube.com/watch?v=CNjLR3ScMtU
	#velocity = velocity.lerp(input_direction * speed, 0.05)
	
	# https://www.reddit.com/r/godot/comments/wnvnzs/top_down_with_smooth_movement/
	#if input_direction != Vector2.ZERO:
		#var target_velocity = speed * input_direction
		#velocity = velocity.move_toward(target_velocity, accel * delta)
	#else:
		#velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	#move_and_slide()
	
	# Original code
	velocity = input_direction * speed
	
	# This is one way to get the animations while moving around, but it's not perfect.
	# This needs to be fixed to only play the walk animation when walking, the idle animation when not,
	# The 
	#if input_direction == Input.get_vector("move_left", "move_right"):
	# This helped me with getting the player to only have the walk animation when walking left and right for now.
	# Once I get more animations setup and figure out how to rotate the character I'll fix this.
	# https://www.reddit.com/r/godot/comments/18hpggm/2_directional_movement/
	if Input.get_axis("move_left", "move_right"):
		$AnimatedSprite2D.play("walking")
	else:
		$AnimatedSprite2D.stop()
		
func player_movement(delta):
	#input = get_input()
	input = get_input(delta)
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		#var collision_info = move_and_collide(velocity * delta)
		#if collision_info:
			#velocity = velocity.bounce(collision_info.get_normal())
		#else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
		# This breaks the smooth movement.
		#position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)
		#velocity = velocity.bounce(collision_info.get_normal())
	
		move_and_slide()

func fall():
	if is_on_ceiling():
		motion.y = 0
	if is_on_floor():
		motion.y = 0
	
	motion.y += gravity

