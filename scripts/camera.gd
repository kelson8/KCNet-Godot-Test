extends Camera2D

# https://www.nightquestgames.com/godot-4-camera2d-smooth-zoom-movement/

# This works for zooming in and out with the camera using the mouse scroll wheel.
# TODO Figure out how to make this zoomed in by default.

const CAMERA_MOVEMENT_SPEED : float = 10
const CAMERA_ZOOM_SPEED: Vector2 = Vector2(0.6, 0.6)
const CAMERA_ZOOM_DEFAULT: Vector2 = Vector2(1.5, 1.5)
const CAMERA_ZOOM_MIN : Vector2 = Vector2(1.5, 1.5)
const CAMERA_ZOOM_MAX : Vector2 = Vector2(2.0, 2.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# This seems to work for zooming the camera
func _input(_event) -> void:
	if (Input.is_action_pressed("mouse_wheel_up")):
		if (get_zoom() < CAMERA_ZOOM_MAX):
			set_zoom(get_zoom() * (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED))
		#move_local_y(-CAMERA_MOVEMENT_SPEED)
	
	if (Input.is_action_pressed("mouse_wheel_down")):
		#move_local_y(CAMERA_MOVEMENT_SPEED)
		if (get_zoom() > CAMERA_ZOOM_MIN):
			set_zoom(get_zoom() / (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED))
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
