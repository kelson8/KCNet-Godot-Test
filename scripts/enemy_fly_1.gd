extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	$AnimatedSprite2D.play()
	# Add the gravity.
	
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	
	# New
	# Make the enemy chase the player. This works and they have a collision also
	if player_chase:
		position += (player.position - position) / speed
		
		# Test flipping the player animation around
		# https://www.youtube.com/watch?v=9u59U-DWNJs&list=PL3cGrGHvkwn0zoGLoGorwvGj6dHCjLaGd&index=4
		# This works on the enemy, but not the player
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false

	# TODO Add idle animation to this		
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.play()
		
# https://www.youtube.com/watch?v=9u59U-DWNJs&list=PL3cGrGHvkwn0zoGLoGorwvGj6dHCjLaGd&index=4
var speed = 50
var player_chase = false
var player = null
 

# Whatever enters the detection area is under the variable body
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
