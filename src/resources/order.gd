extends Resource
class_name Order

@export var base: Base
@export var meat_type: MeatType
@export var vegies: bool
@export var sauces: Array[int]
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

enum Base {RICE, PITA}
enum SodaType {Coke, DrPepper, Fanta, Sprite}
enum MeatType {Lamb, Chicken, Combo, Falafel}
enum SauceType {White, Hot, Green, Barbeque}
