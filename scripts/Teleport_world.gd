extends Area2D

# Change scenes tutorial: https://www.youtube.com/watch?v=FuIn_1aK7rM

# Sky world, teleport from the rpg world.
var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	
func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://scenes/sky_world1.tscn")
			
