extends Area2D

# Change scenes tutorial: https://www.youtube.com/watch?v=FuIn_1aK7rM
# Sky world, teleport from the rpg world.

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
	

func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/world_1.tscn")
		
