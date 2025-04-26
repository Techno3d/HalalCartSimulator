extends Node2D
var customers = ["Guy1","Guy2","Guy3","Guy4"]
var conversationStarters = ["Can I have a","One","Could I get a"]
@export var minCustomerTime = 3
@export var maxCustomerTimer = 4
var activeCustomers = []
var activeOrders = []
var currentOrder = 0
@onready var order_things: HBoxContainer = $Control/OrderThings
var orderSlipScene: PackedScene = preload("res://OrderSlip.tscn")


func _ready():
	randomize()
	$Control/CenterContainer/AnimatedSprite2D.play("Default")
	$CustomerTimer.start(randf_range(minCustomerTime,maxCustomerTimer))
	$Control2.hide()

func _process(delta):
	pass

func changeCustomer(orderString,order):
	var currentCustomer = customers[randi() % customers.size()]
	$Control2.show()
	$Control3.hide()
	ManagementHr.activeCustomers.push_back(currentCustomer)
	ManagementHr.activeOrders.push_back(order)
	var slip: OrderSlip = orderSlipScene.instantiate()
	order_things.add_child(slip)
	slip.update_text(ManagementHr.activeCustomers.size()-1, orderString)
	
	$Control2/CenterContainer2/RandomStarter.text = conversationStarters[randi() % conversationStarters.size()]
	$Control2/CenterContainer3/Order.text = orderString
	$Control/CenterContainer/AnimatedSprite2D.animation = currentCustomer
	$Control/CenterContainer/AnimatedSprite2D.play()
	print(activeCustomers,activeOrders)

func _on_customer_timer_timeout() -> void:
	var order = Unlocks.random_order()
	changeCustomer(order.text(),order)


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
