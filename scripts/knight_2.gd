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

func _ready():
	screen_size = get_viewport().size
	
	# New
	var camera = get_node("Camera")  # Get the Camera2D node

#func _physics_process(delta):
	#set_velocity(motion)
	#set_up_direction(UP)
	##get_input()
	#get_input(delta)
	##player_movement(delta)
	#move_and_slide()
	
func _physics_process(delta):
	set_velocity(motion)
	set_up_direction(UP)
	#get_input()
	#player_movement(delta)
	# This stops the player movement but doesn't disable the animation, where is that defined?
	
	if can_move:
		get_input(delta)
		move_and_slide()
	

# https://www.youtube.com/watch?v=qIL3wtSATQ4&t=162s

# This just crashes it.
# Camera zooming
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.is_pressed():
			#if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				#if camera.zoom > zoom_minimum:
					#camera.zoom -= zoom_speed
					#pass
			#if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				#if camera.zoom < zoom_maximum:
					#camera.zoom += zoom_speed
					#pass

# Test
# https://www.youtube.com/watch?v=uU-v20-mWNY
# This doesn't work.
#func _input(event):
	#if event.is_action("mouse_wheel_down"):
		#if zoom_maximum > 1:
			#mouse_position = get_viewport.get_mouse_position()
#


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
	#if input_direction == Input.get_vector("move_left", "move_right"):
	# This helped me with getting the player to only have the walk animation when walking left and right for now.
	# Once I get more animations setup and figure out how to rotate the character I'll fix this.
	# https://www.reddit.com/r/godot/comments/18hpggm/2_directional_movement/
	if Input.get_axis("move_left", "move_right"):
		$AnimatedSprite2D.play("walking")
	else:
		# This fixes the idle animation
		$AnimatedSprite2D.play("idle")
		#$AnimatedSprite2D.stop()
		
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