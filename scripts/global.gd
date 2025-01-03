#extends Node

# https://www.youtube.com/watch?v=bHm-cRwX_yg

class_name PlayerTest extends Node
var player
#var player_position

var current_scene = null

func _ready():
	# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
	var root = get_tree().root
	# Using a negative index counts from the end, so this gets the last child node of `root`.
	current_scene = root.get_child(-1)
	

func register_player(in_player):
	player = in_player
	# TODO Figure out how to set these
	player.health = 10
	player.damage = 5
	player.defense = 5
	player.attack_speed = 5
	
# Test
# Singletons, these don't work and crash when teleporting with the scenes
# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
#
	
