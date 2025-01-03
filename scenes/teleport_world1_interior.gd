extends Area2D

# Change scenes tutorial: https://www.youtube.com/watch?v=FuIn_1aK7rM
# World 1 interior to World 1.

# TODO Lock the door and make it unlock only when the coin is picked up.
var entered = false

# Enter label test
# Broken
# TODO Fix this
#var enterLabel = EnterLabel.new().enterLabel

# TODO Fix this door lock system to work, unlock door when coin is picked up.
var doorLocked = false

# This works for showing/hiding the exit label.
@onready var exitLabel = $ExitLabel





# TODO Set this to lock/unlock the door with the coin.
func _on_body_entered(body: PhysicsBody2D):
	if doorLocked:
		pass
	else:
		entered = true
		
		# Show the label "Exit building?" if close
		if not exitLabel.is_visible():
			exitLabel.show()
		
		# # Debug text
		#print("Entered")

func _on_body_exited(body: PhysicsBody2D):
	if doorLocked:
		pass
	else:
		entered = false
		
		# Hide the label "Exit building?" if moved away
		if exitLabel.is_visible():
			exitLabel.hide()

		# Debug text
		# print("Exited")
	

# Test
#@onready var knight2 = get_node("knight2")

var center_of_map = Vector2(863.1, 325.8)

func _physics_process(delta):
	#var knight2 = get_node("/root/Global")
	
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			# https://forum.godotengine.org/t/is-there-a-way-to-get-a-export-variable-value/16577
			
			#knight2.player_position = center_of_map
			#knight2.global_position = center_of_map
			
			#get_node("knight2").global_position = center_of_map
			# This just crashes it.
			#knight2.position = Vector2(863.1, 325.8)
			#player.position = Vector2(863.1, 325.8)
			# Crashes
			#Global.goto_scene("res://scenes/world_1.tscn")
			get_tree().change_scene_to_file("res://scenes/world_1.tscn")
			# Well this doesn't crash, but it doesn't seem to work either.
			#Global.player_position = center_of_map
		
