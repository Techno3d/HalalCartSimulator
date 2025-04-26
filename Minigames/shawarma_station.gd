extends Control

@onready var knife: Sprite2D = $Knife
@onready var lamb_label: Label = $HBoxContainer/Lamb/HBoxContainer/VBoxContainer/Amounts
@onready var chicken_label: Label = $HBoxContainer/Chicken/HBoxContainer/VBoxContainer/Amounts
@onready var falalfel_label: Label = $HBoxContainer/Falafel/HBoxContainer/VBoxContainer/Amounts
@onready var falafel_box: Button = $ColorRect/Button
@onready var hit_box_3: ShawarmaBox = $TextureRect/HitBox3
@onready var falafel_timer: Timer = $FalafelTimer
@onready var progress_bar: ProgressBar = $ProgressBar

func _ready() -> void:
	falafel_box.pressed.connect(func(): 
		falafel_timer.start()
		falafel_timer.timeout.connect(func():
				hit_box_3.is_falalfel_done = true
				get_tree().create_timer(4).timeout.connect(func(): hit_box_3.burn())
		)
	)

func _process(delta: float) -> void:
	knife.position = get_global_mouse_position()
	lamb_label.text = "%.2f oz" % [ManagementHr.oz_of_lamb]
	chicken_label.text = "%.2f oz" % [ManagementHr.oz_of_chicken]
	falalfel_label.text = "%.2f oz" % [ManagementHr.oz_of_falalfel]
	progress_bar.value = falafel_timer.time_left
