extends CharacterBody2D

# Zooming (Not in use I don't think):
# https://www.youtube.com/watch?v=qIL3wtSATQ4&t=162s
# https://www.youtube.com/watch?v=uU-v20-mWNY

# TODO Come up with a game name for this, for now it's called KCNet-Godot-Test
# Possible ideas: 
# KelsonCraft Game, KCNet Game Demo, KCNet RPG Test, KCNet RPG Demo

# List of GUI items to add:
# TODO Implement game pause menu and main menu. -- Partially complete

# List of items to do for knight2 and fly enemy:
# TODO Implement character health, basic rpg leveling up system.
# TODO Implement character attacks, character animations for walking up/down. 

# Added character rotate left/right depending on which direction you are walking.

# I partially fixed the code for the fly, so it can now come after the player.
# Although I don't know how to make it stop chasing the player.
# I still need to implement the basic health system and attacking system.

# TODO Implement enemy movement and health, possibly make fly shoot lasers or something at
# the player, make it charge at the player and kill them if they get close.


# New
class_name knight2
@export var knight2 : CharacterBody2D

const max_speed = 400
var deceleration = 1000
const accel = 1000
const friction = 600
var speed = 250

# New gravity test, oops I already had this defined.
#const gravity = 200.0

var input = Vector2.ZERO

const UP = Vector2(0,-1)
var motion = Vector2()

# New
const gravity = 15
const jump_speed = -300


#

# I got the camera to work by adding it to the knight2 character instead of the worlds.
# https://www.youtube.com/watch?v=PDXknOG1NR0


# Camera zooming
#var zoom_minimum = Vector2(.0000001, .0000001)
#var zoom_maximum = Vector2(2.50000001, 2.50000001)
#var zoom_speed = Vector2(.30000001, .30000001)

# New camera zooming test
var edge_margin = 5
var camera_speed = 200.0
var map_size = Vector2(640, 540)
var viewport_size = Vector2(320, 180)
var un_zoomed_viewport_size = Vector2(640, 360)
var zoom_x = 2
var zoom_y = 2

# 2
#https://www.gdquest.com/tutorial/godot/2d/camera-zoom/
#var min_zoom = 0.5
#var max_zoom = 2.0
#var zoom_factor = 0.1
#var zoom_duration = 0.2
#
#var _zoom_level = 1.0

#func _set_zoom_level(value: float) -> void:
	#_zoom_level = clamp(value, min_zoom, max_zoom)
	#tween.interpolate_property(
		#self,
		#"zoom",
		#Vector2(_zoom_level, _zoom_level),
		#zoom_duration,
		#tween.TRANS_SINE,
		#tween.EASE_OUT
	#)

#

# https://www.reddit.com/r/godot/comments/180lvl6/what_exactly_is_onready/
@onready var camera = Camera2D
#

# Can I add a toggle for this in ImGui as a test?
#@export var can_move = true:

# https://godottutorials.com/courses/introduction-to-gdscript/godot-tutorials-gdscript-22/
var can_move = true

# I did't get this working.
var test : bool :
	get:
		return can_move
	set(value):
		can_move = value

#func setFunction(param1):
	#can_move = param1
	#
#func getFunction():
	#return can_move


@onready var anim = $AnimatedSprite2D

# This seems to be used as a boundry for the game window.
var screen_size # Size of the game window.

#func set_position(x, y):
	#$"/root/global".player.set_position(22, 22)

func _ready():
	screen_size = get_viewport().size
	
	# New
	var camera = get_node("Camera")  # Get the Camera2D node
	
	# New for global
	#$"/root/global".register_player(self)
	
	# Pausing the game
	#process_mode = Node.PROCESS_MODE_PAUSABLE

# https://forum.godotengine.org/t/issue-with-game-pausing-while-in-menu/71749
func _resume():
	get_tree().paused = false
	#Engine.time_scale = 1
	
func _pause():
	get_tree().paused = true
	# https://forum.godotengine.org/t/un-pause-with-an-input-event/44136/4
	set_process_input(true)
	#Engine.time_scale = 0

# TODO Fix this to not break the game.
#func _on_pause_button_pressed():
	## https://www.reddit.com/r/godot/comments/b7jd95/help_making_a_pause_menu_open_and_close_with/
	#if Input.is_action_just_pressed("pause_button"):
		## TODO Get this to open the main menu with ESCAPE key.
		#if get_tree().paused == false:
			##get_tree().paused = true
			#_pause()
			#get_tree().change_scene_to_file("res://scenes/menus/main_menu/main_menu.tscn")
			##pass
		#else:
			#get_tree().paused = false
			#_resume()
			# TODO Change to previous scene.
			#pass
			
			#
	#if get_tree().paused == false:
		#get_tree().paused = true
	#else:
		#get_tree().paused = false

#func _input(event):
	#_on_pause_button_pressed()

#func _physics_process(delta):
	#set_velocity(motion)
	#set_up_direction(UP)
	##get_input()
	#get_input(delta)
	##player_movement(delta)
	#move_and_slide()
	
# TODO Fix this to show up the pause menu.
func toggle_pause():
	if get_tree().is_paused():
		get_tree().set_pause(false)
	else:
		get_tree().set_pause(true) 
		# TODO Show pause menu
		
	
# Print out the current mouse position X and Y
# TODO Set a timer or something for this and log to file when button is pressed.
# TODO Add button to ImGui menu for logging.
var mouse_pos = false


func _physics_process(delta):
	set_velocity(motion)
	set_up_direction(UP)
	#get_input()
	#player_movement(delta)
	# This stops the player movement but doesn't disable the animation, where is that defined?
	
	# Test
	# TODO Fix this to work.
	#_on_pause_button_pressed()
	#if Input.is_action_just_pressed("pause_button"):
		#toggle_pause()
		#get_viewport().set_input_as_handled()
	#
	
	# Add player position
	var player_position = position
	
	if can_move:
		get_input(delta)
		move_and_slide()

		if mouse_pos:
			# https://www.youtube.com/watch?v=ilsAHjgRdQc
			var mouse_pos = get_viewport().get_mouse_position()
			print(mouse_pos)


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

	# https://www.reddit.com/r/godot/comments/18hpggm/2_directional_movement/
			
	# I finally figured out how to make the player change directions when moving
	# I took the same concept I learned from the enemy and adapted it.
	var player_position = position
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.flip_h = true
		
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.flip_h = false
			

		
	
	if Input.get_axis("move_left", "move_right"):
		$AnimatedSprite2D.play("walking")
	else:
		# This fixes the idle animation
		$AnimatedSprite2D.play("idle")
		

# Add test for gravity, this would be useful on a platformer mario like game.
# This test game will be some type of RPG game though.
var gravity_test = true
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

		# Test for gravity
		# https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html
		# This doesn't add gravity but seems to fix the movement somewhat.
		if gravity_test:
			velocity.y += delta * gravity
			move_and_collide(velocity)
		else:
			# Normal, without gravity test.
			move_and_slide()

# This isn't in use yet
# TODO Fix this to work.
func fall():
	if is_on_ceiling():
		motion.y = 0
	if is_on_floor():
		motion.y = 0
	
	motion.y += gravity


# https://forum.godotengine.org/t/problem-getting-player-position-from-another-scene/54745
# This allows me to use something like this to set the player position:

# Store the position as a variable: var center_of_map = Vector2(500.2, 300.2)
# Set the player position: Global.player.global_position = center_of_map
func _on_tree_entered():
	Global.player = self
	# Not in use.
	#Global.player_position = position
