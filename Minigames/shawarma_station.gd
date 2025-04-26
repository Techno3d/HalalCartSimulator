extends Control

@onready var knife: Sprite2D = $Knife

func _process(delta: float) -> void:
	knife.position = get_global_mouse_position()
