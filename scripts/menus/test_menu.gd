extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	# Allow keyboard control
	# TODO Make this scroll faster for the sliders
	$TestContainer/CheckButton.grab_focus()
	#$OptionsContainer/MusicVolumeSlider.grab_focus()

func _process(delta):
	pass

@onready var main_menu = $MenuContainer
@onready var options_menu = $OptionsMenu


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/menu_test.tscn")


@onready var test_label = $TestContainer/TestLabel
func _on_check_button_toggled(toggled_on):
	if toggled_on:
		test_label.text = "On"
	else:
		test_label.text = "Off"
