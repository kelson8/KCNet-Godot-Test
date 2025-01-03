extends Area2D


@onready var entered = false

# Idea for this came from here: https://www.youtube.com/watch?v=QP_lET2SuOQ
@onready var player = preload("res://scenes/knight_2.tscn")

# TODO Fix this to teleport the player to other locations on the same scene.
# I tried for hours to figure this out.

#var player

# Called when the node enters the scene tree for the first time.
func _ready():
	# https://forum.godotengine.org/t/i-get-invalid-access-to-property-or-key-global-position-on-a-base-object-of-type-null-instance-error/92144
	#player = get_tree().current_scene.get_node("Player")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_on_screen_position(node: Node2D, screen_position:Vector2):
	var canvas_position = node.get_canvas_transform().origin
	node.global_position = screen_position - canvas_position

# https://www.reddit.com/r/godot/comments/c0rzpa/how_can_i_make_the_area2d_teleport_the_player/
func _on_body_entered(body):
	entered = true
	#print("Entered")
	#if Input.is_action_just_pressed("ui_accept"):
		##if body.is_in_group("Player"):
			### Not sure of how to use this.
			###set_on_screen_position(Area2D, Vector2(22, 22))
			##body.position = Vector2(863.1, 325.8)
			#player.global_position.x = 863.1
			#player.global_position.y = 325.8
			##translation = Vector2(863.1, 325.8)
			#print("Enter button pressed")


func _on_body_exited(body):
	entered = false
	#print("Exited")
	

# This just crashes it.
func set_player_position(x, y):
	player.global_position.x = x
	player.global_position.y = y
	#player.global_position.x = 863.1
	#player.global_position.y = 325.8	

#var center_of_map = Vector2(863.1, 325.8)
var center_of_map = Vector2(500.2, 300.2)

func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			#Global.player_position = center_of_map
			# OMG I finally got this working!!!!
			# I used globals!!!!
			# https://forum.godotengine.org/t/problem-getting-player-position-from-another-scene/54745
			Global.player.global_position = center_of_map
			#set_player_position(863.1, 325.8)
			#print("Enter button pressed")
			
			#stage.get_node("Player").position = Vector2(55, 55)
			#Position = Vector2(55,55)
		#body.position = Vector2(55, 55)
