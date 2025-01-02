extends Control

# https://www.youtube.com/watch?v=e9-WQg1yMCY

# TODO Figure out how to make this work properly, then re-add into the scenes.

func resume():
	#get_tree().paused = false
	Engine.time_scale = 1
	$AnimationPlayer.play_backwards("blur")

func pause():
	#get_tree().paused = true
	Engine.time_scale = 0
	$AnimationPlayer.play("blur")

@onready var resume_button: Button

func _pause_button_pressed():
	if Input.is_action_just_pressed("pause_button") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause_button") and get_tree().paused:
		resume()
		#if get_tree().paused == false:
			#pause()
		#else:
			#resume()

# Called when the node enters the scene tree for the first time.
func _ready():
	#resume_button.connect(resume)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_pause_button_pressed()


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


# TODO Fix this to work.
func _on_main_menu_pressed():
	_pause_button_pressed()
	#pass # Replace with function body.
