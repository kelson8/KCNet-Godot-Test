extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	print("Floor was hit.")

# https://forum.godotengine.org/t/how-to-do-area-entered-in-2d-it-doesnt-work/5661/2
func _on_body_entered(body):
	print("Floor was hit.")
