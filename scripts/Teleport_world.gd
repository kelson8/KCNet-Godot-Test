extends Area2D

# Change scenes tutorial: https://www.youtube.com/watch?v=FuIn_1aK7rM

# Teleport to world 1 interior, castle #1, teleport from world 1.
var entered = false

# This almost works for showing/hiding an enter label.
# https://forum.godotengine.org/t/how-to-show-label-text/17704

#var enterLabel = get_tree().get_root().get_node("scenes/EnterLabel")

# TODO Merge all of these teleports into one file, use switch statements if they are in this language.
# Figure out how to check which scene the player is in.

# This works for showing/hiding the enter label.
@onready var enterLabel = $EnterLabel

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	
	# Show the label "Enter building?" if close
	if not enterLabel.is_visible():
		enterLabel.show()
	
	# Debug text
	#print("Entered")

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	# Debug text
	# print("Exited")
	
	# Hide the label "Enter building?" if moved away
	if enterLabel.is_visible():
		enterLabel.hide()
	

func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			#get_tree().change_scene_to_file("res://scenes/sky_world1.tscn")
			get_tree().change_scene_to_file("res://scenes/world_1_interior.tscn")
			
