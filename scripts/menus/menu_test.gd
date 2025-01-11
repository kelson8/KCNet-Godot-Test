extends Control

# TODO Rename file to main_menu, to make this different from test_menu

# Godot main nenu tutorial: https://www.youtube.com/watch?v=Mx3iyz8AUAE

# I used Audio stream player to add music to this:
# https://www.youtube.com/watch?v=_QgibOnAtek

# TODO Setup this main menu to work as a pause menu for now.

# TODO Make music sync from this scene and options.
# instead of resetting the music each time.

# Called when the node enters the scene tree for the first time.
func _ready():
	# Allow keyboard control
	$MenuContainer/StartButton.grab_focus()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	# Change to world_1 interior scene
	#get_tree().change_scene_to_file("res://scenes/world_1.tscn")
	get_tree().change_scene_to_file("res://scenes/world_1_interior.tscn")

@onready var main_menu = $MenuContainer
@onready var options_menu = $OptionsMenu

func _on_options_button_pressed():
	# Change to options scene
	# This also works, I can keep the music in sync and hide the rest of the menu.
	# This makes it to where the music won't mess up
	# TODO Fix this to work.
	#options_menu.show()
	#main_menu.hide()
	get_tree().change_scene_to_file("res://scenes/menus/options_menu.tscn")

func _on_test_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/test_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
