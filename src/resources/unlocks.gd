extends Node

var unlocked_sauces: Array[Order.SauceType] = [Order.SauceType.White]
var locked_sauces: Array[Order.SauceType] = [Order.SauceType.Hot, Order.SauceType.Green, Order.SauceType.Barbeque]

var unlocked_soda: Array[Order.SodaType] = [Order.SodaType.Coke]
var locked_soda: Array[Order.SodaType] = [Order.SodaType.DrPepper, Order.SodaType.Pepsi, Order.SodaType.Sprite]

func unlock_sauce():
	unlocked_sauces.push_back(locked_sauces.pop_front())
	
func unlock_soda():
	unlocked_soda.push_back(locked_soda.pop_front())

func random_order() -> Order:
	var the_sauces: Array[Order.SauceType] = [];
	for n in range(0, 3):
		the_sauces.push_back(unlocked_sauces.pick_random())
	return Order.new(randi_range(0, 1), randi_range(0, 2), randf() < 0.8, the_sauces, unlocked_sauces.pick_random())
