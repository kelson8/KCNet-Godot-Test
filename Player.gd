extends CharacterBody2D

# The smooth movement code came from the below video.
# https://www.youtube.com/watch?v=KceMokK2qFA&list=PL3cGrGHvkwn0sfRucpwMSOMMDvLXKdmv1&index=31

# I finally got collision working! I don't know what I changed. 4-12-2024 @ 1:33AM

# I'm on this guide: https://www.youtube.com/watch?v=NAVtmW5KM6Q&list=PL3cGrGHvkwn0sfRucpwMSOMMDvLXKdmv1&index=2

# I wonder if I could add some kind of power up that temporarily increases the max speed.
const max_speed = 400
const accel = 1000
const friction = 600
var speed = 400

#var velocity = Vector2(250,250)

var input = Vector2.ZERO

const UP = Vector2(0,-1)
var motion = Vector2()

func _physics_process(delta):
	# I tried to use what they were using in the Mega Bot project and the player doesn't move with this.
	#set_velocity(motion)
	#set_up_direction(UP)
	get_input()
	move_and_slide()
	
	position = position.clamp(Vector2.ZERO, screen_size)
	#move_and_collide(motion)
	#player_movement(delta)

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
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


func player_movement(delta):
	input = get_input()
	
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
 
