extends Resource
class_name Order

@export var base: Base
@export var meat_type: MeatType
@export var vegies: bool
@export var sauces: Array[SauceType]
@export var soda: SodaType

func text() -> String:
	var ret: String = "";
	ret += MeatType.keys()[meat_type]
	
	if(base == Base.RICE):
		ret += " over rice "
	else:
		ret += " gyro "
	if(vegies): 
		ret += "with salad " 
	else:
		ret += "without salad "
	ret += "and a " + SodaType.keys()[soda]
	return ret

func _init(p_base: Base, p_meat_type: MeatType, p_vegies: bool, p_sauces: Array[SauceType], p_soda: SodaType) -> void:
	base = p_base
	meat_type = p_meat_type
	vegies = p_vegies
	sauces = p_sauces
	soda = p_soda

func random_order() -> Order:
	var the_sauces = [];
	for n in range(0, 3):
		the_sauces.push_back(randi_range(0, 3))
	return Order.new(randi_range(0, 1), randi_range(0, 3), randf() < 0.8, the_sauces, randi_range(0, 3))

enum Base {RICE, PITA}
enum SodaType {Coke, DrPepper, Fanta, Sprite}
enum MeatType {Lamb, Chicken, Combo, Falafel}
enum SauceType {White, Hot, Green, Barbeque}
