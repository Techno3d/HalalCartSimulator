extends Control

var is_pressed: bool = false
@export var type: int = 0

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if type == 0:
			ManagementHr.oz_of_lamb += 0.1
			print(ManagementHr.oz_of_lamb)
		elif type == 1:
			ManagementHr.oz_of_chicken += 0.1
		#elif type == 2:
			#ManagementHr.oz_of_lamb += 0.1
