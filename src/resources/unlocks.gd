extends Node

var unlocked_sauces: Array[Order.SauceType]
var locked_sauces: Array[Order.SauceType]

var unlocked_soda: Array[Order.SodaType]
var locked_soda: Array[Order.SodaType]

func unlock_sauce():
	unlocked_sauces.push_back(locked_sauces.pop_front())
	
func unlock_soda():
	unlocked_soda.push_back(locked_soda.pop_front())
