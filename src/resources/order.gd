extends Resource
class_name Order

@export var base: Base
@export var meat_type: MeatType
@export var vegies: bool
@export var sauces: Array[int]
@export var soda: SodaType

enum Base {RICE, PITA}
enum SodaType {Coke, DrPepper, Fanta, Sprite}
enum MeatType {Lamb, Chicken, Combo, Falafel}
enum SauceType {WHITE, HOT, GREEN, DRPEPPER}
