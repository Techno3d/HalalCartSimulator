extends Node2D
var customers = ["Guy1","Guy2","Guy3","Guy4"]
var conversationStarters = ["Can I have a","One","Could I get a"]
@export var minCustomerTime = 30
@export var maxCustomerTimer = 45
var activeCustomers = []
var activeOrders = []
var currentOrder = 0
@onready var order_things: HBoxContainer = $Control/OrderThings
var orderSlipScene: PackedScene = preload("res://OrderSlip.tscn")
var changeNeeded = false
var order = Unlocks.random_order()

signal back

func _ready():
	randomize()
	$Control/CenterContainer/AnimatedSprite2D.play("Default")
	$CustomerTimer.start(5)
	$Control2.hide()

func _process(delta):
	if visible and changeNeeded:
		changeCustomer(order.text(),order)

func changeCustomer(orderString,order):
	changeNeeded=false
	var currentCustomer = customers[randi() % customers.size()]
	$Control2.show()
	$Control3.hide()
	ManagementHr.activeCustomers.push_back(currentCustomer)
	ManagementHr.activeOrders.push_back(order)
	var slip: OrderSlip = orderSlipScene.instantiate()
	order_things.add_child(slip)
	slip.update_text(ManagementHr.activeCustomers.size()-1, orderString, order)
	slip.button.pressed.connect(func():
		assembly()
		Unlocks.currently_selected = slip.order
		Unlocks.idx = slip.order_num
	)
	#slip.scale = Vector2(0.6, 0.6)
	
	$Control2/CenterContainer2/RandomStarter.text = conversationStarters[randi() % conversationStarters.size()]
	$Control2/CenterContainer3/Order.text = orderString
	$Control/CenterContainer/AnimatedSprite2D.animation = currentCustomer
	$Control/CenterContainer/AnimatedSprite2D.play()
	print(activeCustomers,activeOrders)

func _on_customer_timer_timeout() -> void:
	order = Unlocks.random_order()
	changeNeeded=true

func assembly():
	$Control.hide()
	$Control3.hide()
	$Assembly.show()
	assembly
	

func _on_button_button_up() -> void:
	$CustomerTimer.start(randf_range(minCustomerTime,maxCustomerTimer))
	$Control/CenterContainer/AnimatedSprite2D.play("Default")
	$Control2.hide()
	$Control3.show()


func _on_cutting_button_up() -> void:
	$Control.hide()
	$Control3.hide()
	$Cutting.show()


func _on_cutting_back() -> void:
	$Control.show()
	$Control3.show()


func _on_shwarma_back() -> void:
	print("AAA")
	$Control.show()
	$Control3.show()
	$Shwarma.hide()


func _on_shwarma_station_button_up() -> void:
	$Control.hide()
	$Control3.hide()
	$Shwarma.show()


func _on_assembly_submit() -> void:
	$Assembly.hide()
	$Control.show()
	$Control3.show()
	
