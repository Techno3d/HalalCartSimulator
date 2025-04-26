extends Control

@onready var knife: Sprite2D = $TextureRect/Knife
@onready var lamb_label: Label = $TextureRect/HBoxContainer/Lamb/HBoxContainer/VBoxContainer/Amounts
@onready var chicken_label: Label = $TextureRect/HBoxContainer/Chicken/HBoxContainer/VBoxContainer/Amounts
@onready var falalfel_label: Label = $TextureRect/HBoxContainer/Falafel/HBoxContainer/VBoxContainer/Amounts
@onready var falafel_box: Button = $TextureRect/ColorRect2/Button
@onready var hit_box_3: ShawarmaBox = $TextureRect/HitBox3
@onready var falafel_timer: Timer = $TextureRect/FalafelTimer
@onready var progress_bar: ProgressBar = $TextureRect/ProgressBar
@onready var uncooked_fafafel: Sprite2D = $TextureRect/UncookedFafafel

signal back

func _ready() -> void:
	#hide()
	falafel_box.pressed.connect(func(): 
		uncooked_fafafel.show()
		falafel_timer.start()
		falafel_timer.timeout.connect(func():
				hit_box_3.is_falalfel_done = true
				get_tree().create_timer(4).timeout.connect(func():
					hit_box_3.burn()
					uncooked_fafafel.hide()
				)
		)
	)

func _process(delta: float) -> void:
	knife.position = get_global_mouse_position()
	lamb_label.text = "%.2f oz" % [ManagementHr.oz_of_lamb]
	chicken_label.text = "%.2f oz" % [ManagementHr.oz_of_chicken]
	falalfel_label.text = "%.2f oz" % [ManagementHr.oz_of_falalfel]
	progress_bar.value = falafel_timer.time_left


func _on_back_button_up() -> void:
	back.emit()
