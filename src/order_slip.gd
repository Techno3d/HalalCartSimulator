extends Control
class_name OrderSlip

@onready var orderNumber: Label = $ColorRect/HBoxContainer/VBoxContainer/Label2
@onready var orderText: Label = $ColorRect/HBoxContainer/VBoxContainer/Label3
@onready var h_box_container: HBoxContainer = $ColorRect/HBoxContainer
var order: Order
var order_num: int

func update_text(order_number: int, order_text, p_order: Order):
	orderNumber.text = str(order_number)
	orderText.text = str(order_text)
	order_num = order_number
	order = p_order
