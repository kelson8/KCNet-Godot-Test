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

# TODO Set this to lock/unlock the door with the coin.
func _on_body_entered(body: PhysicsBody2D):
	if doorLocked:
		pass
	else:
		entered = true
		#enterLabel.show()
		
		# This prints but doesn't show the label.
		print("Entered")

func _on_body_exited(body: PhysicsBody2D):
	if doorLocked:
		pass
	else:
		entered = false
		print("Exited")
		#enterLabel.hide()
	

func _physics_process(delta):
	if entered == true:
		#enterLabel.show()
		#enterLabel.hide
		#enterLabel.hidden = false
		
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/world_1.tscn")
	#else:
		#enterLabel.hidden = true
			
