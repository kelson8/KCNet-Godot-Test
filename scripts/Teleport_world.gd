extends Area2D

# Change scenes tutorial: https://www.youtube.com/watch?v=FuIn_1aK7rM
# Teleport to rpg world 1 interior 1, teleport from the rpg world.
var entered = false

# This almost works for showing/hiding an enter label.
# https://forum.godotengine.org/t/how-to-show-label-text/17704

#var enterLabel = get_tree().get_root().get_node("scenes/EnterLabel")

# TODO Merge all of these teleports into one file, use switch statements if they are in this language.
# Figure out how to check which scene the player is in.

@export var enterLabel : EnterLabel

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	#if not enterLabel.is_visible():
		#enterLabel.show()
	# This prints but doesn't show the label.
	#print("Entered")

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	#print("Exited")
	#if enterLabel.is_visible():
		#enterLabel.hide()
	#enterLabel.hide()
	

func _physics_process(delta):
	if entered == true:
		#enterLabel.show()
		#enterLabel.hide
		#enterLabel.hidden = false
		
		if Input.is_action_just_pressed("ui_accept"):
			#get_tree().change_scene_to_file("res://scenes/sky_world1.tscn")
			get_tree().change_scene_to_file("res://scenes/world_1_interior.tscn")
	#else:
		#enterLabel.hidden = true
			
