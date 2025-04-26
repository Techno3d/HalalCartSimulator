extends Control

var state = 1
var Reserve = false
var Cutting = false

signal back

func _ready():
	hide()
	$CutLettuce/AnimatedSprite2D.play("default")

func _process(delta):
	$Knife.position = get_global_mouse_position() + Vector2(-25,20)
	$CenterContainer2/Label.text = "Lettuce: " + str(ManagementHr.oz_of_lettuce) + " oz"

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click"):
		if visible:
			click()

func click():
	if Reserve:
		state = 2
		$CutLettuce/AnimatedSprite2D.play("Lettuce")
	
	if Cutting and state==2:
		ManagementHr.oz_of_lettuce += 0.1
		state = 3
		$CutLettuce/AnimatedSprite2D.play("Cut")

func _on_reserve_2d_area_entered(area: Area2D) -> void:
	Reserve = true


func _on_reserve_2d_area_exited(area: Area2D) -> void:
	Reserve = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	Cutting = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	Cutting = false


func _on_button_button_up() -> void:
	hide()
	back.emit()
