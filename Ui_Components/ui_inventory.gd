extends Control

var current_item: String =""
var has_item:bool=false

func _process(delta: float) -> void:
	pass
	
	
func pickup_item(itemName:String):
	current_item=itemName;
	var items = $ItemSprite
	items.texture = load("res://Ui_Components/art/inventory_sprites/activationKey.png")
