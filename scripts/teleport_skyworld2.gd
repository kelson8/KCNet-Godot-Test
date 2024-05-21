extends Area2D

# Sky world 2 to skyworld 1 teleport

var entered = false
var enter_label = Label

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false
	
func _physics_process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			# Switch to teleport to sky_world2
			#get_tree().change_scene_to_file("res://scenes/world_1.tscn")
			get_tree().change_scene_to_file("res://scenes/sky_world1.tscn")

