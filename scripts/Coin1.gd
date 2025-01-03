extends AnimatedSprite2D

# https://forum.godotengine.org/t/how-to-export-variables-in-godot-4-0/14062/2
# I'm not sure how to use exports just yet.
#@export var Coin : AnimatedSprite2D

# https://www.youtube.com/watch?v=tN76BJ2XyDQ
signal key_picked_up
var key_taken = false
var in_door_zone = false
#

# TODO Make it to where once the coin is picked up, 
# it opens a locked door

# TODO Make this to where I don't need to duplicate this code for each coin, possibly use an export?

# I had to select "Autoplay on load" in the animation menu under AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#var teleport_target_location = Vector2(24,36)
var teleport_target_location = Vector2(854.1, 373.5)

# When the coin is picked up, hide it
# https://www.reddit.com/r/godot/comments/8psv1d/how_can_i_check_if_a_object_is_still_standing_on/
func _on_area_2d_body_entered(body):
	#var Coin = $Coin
	hide()
	
	
	# https://www.reddit.com/r/godot/comments/v6ou2d/how_do_i_move_or_teleport_my_player_to_another/
	# This teleport the player when the coin is picked up.
	# This doesn't seem to react to coords though. It always puts me in the same spot.
	if "Player" in body.name:
		#body.position = teleport_target_location
		body.global_position = teleport_target_location
	
	# I'm not sure how to export this to use it in other classes just yet.
	#if not $Coin.hidden:
		#print("Coin picked up")


# TODO Make this to where it says "Door has been unlocked, you can now go to back"

@onready var pickup_sfx = $PickupSfx
func _on_hidden():
	# https://www.youtube.com/watch?v=ungRKilH2mk
	pickup_sfx.play()
	#print("Coin picked up.")


#func _on_coin_area_2d_body_entered(body):
	#pass # Replace with function body.


func _on_child_entered_tree(node):
	pass # Replace with function body.
