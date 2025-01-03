extends Area2D

@onready var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# https://www.reddit.com/r/godot/comments/c0rzpa/how_can_i_make_the_area2d_teleport_the_player/
func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false

var enter_door_position = Vector2(585.2, 370.2)

func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			#Global.player_position = center_of_map
			# OMG I finally got this working!!!!
			# I used globals!!!!
			# https://forum.godotengine.org/t/problem-getting-player-position-from-another-scene/54745
			Global.player.global_position = enter_door_position
