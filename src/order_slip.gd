extends Control
class_name OrderSlip

@onready var orderNumber: Label = $ColorRect/HBoxContainer/VBoxContainer/Label2
@onready var orderText: Label = $ColorRect/HBoxContainer/VBoxContainer/Label3

func update_text(order_number: int, order_text):
	orderNumber.text = str(order_number)
	orderText.text = str(order_text)
