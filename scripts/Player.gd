extends CharacterBody2D

# The smooth movement code came from the below video.
# https://www.youtube.com/watch?v=KceMokK2qFA&list=PL3cGrGHvkwn0sfRucpwMSOMMDvLXKdmv1&index=31

# I finally got collision working! I don't know what I changed. 4-12-2024 @ 1:33AM

# I'm on this guide: https://www.youtube.com/watch?v=NAVtmW5KM6Q&list=PL3cGrGHvkwn0sfRucpwMSOMMDvLXKdmv1&index=2

# I wonder if I could add some kind of power up that temporarily increases the max speed.
const max_speed = 400
var deceleration = 1000
const accel = 1000
const friction = 600
#var speed = 400
var speed = 100

#var velocity = Vector2(250,250)

var input = Vector2.ZERO

const UP = Vector2(0,-1)
var motion = Vector2()

# New
const gravity = 15
const jump_speed = -300


func _physics_process(delta):
	fall(delta)
	set_velocity(motion)
	set_up_direction(UP)
	#get_input()
	move_and_slide()
	
	#position = position.clamp(Vector2.ZERO, screen_size)
	#move_and_collide(motion)
	#player_movement(delta)

# Todo
# Check if player is in world1, if so set walk mode to left/right and space for jump.
# World_1 (World 2) is an RPG type world, it should be set to walk around with wasd.

# Code from Mega Bot

func fall(delta):
	if is_on_ceiling():
		motion.y = 0
	if is_on_floor():
		motion.y = 0
	motion.y += gravity

# End code from Mega Bot

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
	#velocity = input_direction * speed
	
	# Shows the direction of the input set above
	#print(input_direction)

# Smooth motion
#func get_input():
	##velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
	##move_and_slide()
	##input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#input.x = int(Input.is_key_pressed(KEY_D)) - int(Input.is_key_pressed(KEY_A))
	#input.y = int(Input.is_key_pressed(KEY_S)) - int(Input.is_key_pressed(KEY_W))
	##input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	#return input.normalized()
	
# This seems to be used as a boundry for the game window.
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find the size of the game window.
	#screen_size = get_viewport_rect().size
	screen_size = get_viewport().size
	#hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#player_movement(delta)


#func player_movement(delta):
	#input = get_input()
	#
	#if input == Vector2.ZERO:
		#if velocity.length() > (friction * delta):
			#velocity -= velocity.normalized() * (friction * delta)
		#else:
			#velocity = Vector2.ZERO
	#else:
		##var collision_info = move_and_collide(velocity * delta)
		##if collision_info:
			##velocity = velocity.bounce(collision_info.get_normal())
		##else:
		#velocity += (input * accel * delta)
		#velocity = velocity.limit_length(max_speed)
		#
		## This breaks the smooth movement.
		##position += velocity * delta
		#position = position.clamp(Vector2.ZERO, screen_size)
		##velocity = velocity.bounce(collision_info.get_normal())
	#
		#move_and_slide()
	
# Todo, these need to be completed
# Double jump with space.
func double_jump():
	pass
	
# Gives the player +200% Speed for 15 seconds. 
func speed_powerup():
	pass
	
# Enables triple jump for 15 seconds.
func triple_jump_powerup():
	pass

# Makes the player giant for 15 seconds.
func mega_man_powerup():
	pass

# Makes the player invincible for 15 seconds.
func invincibility_powerup():
	pass
	
# Makes the player shoot lasers from their eyes, destroy anything in your path for 15 seconds.
func heat_vision():
	pass
	
# Troll functions, mostly just for screwing around with.
# Have the floor randomly fall out from under the player when trying to play.
func falling_floor():
	pass

# Makes the enemies about 250% faster, don't expect to survive this wave of chaos.
func faster_enemies():
	pass
	
# Makes the enemies about 50% slower.
func slower_enemies():
	pass
