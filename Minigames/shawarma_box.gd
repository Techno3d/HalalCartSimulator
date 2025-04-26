extends Control
class_name ShawarmaBox

var is_pressed: bool = false
var is_falalfel_done: bool = false
@export var type: int = 0

func _input(event):
	if event is InputEventMouseButton and is_pressed and event.is_pressed() and visible:
		if type == 0:
			ManagementHr.oz_of_lamb += 0.3
			#print(ManagementHr.oz_of_lamb)
		elif type == 1:
			ManagementHr.oz_of_chicken += 0.3
		elif type == 2 and is_falalfel_done:
			is_falalfel_done = false
			ManagementHr.oz_of_falalfel += 4
			
func _ready() -> void:
	mouse_entered.connect(func():
		is_pressed = true
	)
	mouse_exited.connect(func():
		is_pressed = false
	)

func burn():
	is_falalfel_done = false;
