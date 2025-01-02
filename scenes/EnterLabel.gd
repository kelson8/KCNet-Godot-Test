extends Label
class_name EnterLabel

# 6-12-2024
# I never did figure this out.

# https://www.reddit.com/r/godot/comments/18e7yyt/how_to_use_export_on_a_resource_in_godot_4/
# I would like to show the text "Enter building?" to the player if they are close to the doors.
# and have it say "Press enter".

#@export var enterLabel : Label
@export var enterLabel : EnterLabel
#var enterLabel

func _init():
	self.enterLabel = enterLabel
