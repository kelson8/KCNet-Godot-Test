extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	# Allow keyboard control
	# TODO Make this scroll faster for the sliders
	$VBoxContainer/MusicVolumeSlider.grab_focus()
	#$OptionsContainer/MusicVolumeSlider.grab_focus()

func _process(delta):
	pass

@onready var main_menu = $MenuContainer
@onready var options_menu = $OptionsMenu


func _on_main_menu_button_pressed():
	# TODO Fix this to work in Main menu, for now it is hidden and using the options menu scene.
	#main_menu.show()
	#options_menu.hide()
	# Change to main menu scene
	
	get_tree().change_scene_to_file("res://scenes/menus/menu_test.tscn")
