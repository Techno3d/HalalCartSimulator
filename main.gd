extends Node2D
var customers = ["Guy1","Guy2","Guy3"]
var conversationStarters = ["Can I have a","One","Could I get a"]
@export var minCustomerTime = 30
@export var maxCustomerTimer = 45


func _ready():
	randomize()
	$Control/CenterContainer/AnimatedSprite2D.play("Default")
	$CustomerTimer.start(randf_range(minCustomerTime,maxCustomerTimer))
	$Control2.hide()

func _process(delta):
	pass

func changeCustomer(order):
	$Control2.show()
	$Control2/CenterContainer2/RandomStarter.text = conversationStarters[randi() % conversationStarters.size()]
	$Control2/CenterContainer3/Order.text = order
	$Control/CenterContainer/AnimatedSprite2D.animation = customers[randi() % customers.size()]
	$Control/CenterContainer/AnimatedSprite2D.play()


func _on_customer_timer_timeout() -> void:
	changeCustomer("Amogus")


func _on_button_button_up() -> void:
	$CustomerTimer.start(randf_range(minCustomerTime,maxCustomerTimer))
	$Control/CenterContainer/AnimatedSprite2D.play("Default")
	$Control2.hide()
