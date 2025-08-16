extends Control

var current_item: String =""
var has_item:bool=false

var shovel_texture = load("res://Items/Graphics/DevelopmentShovel.png")
var key_texture = load("res://Items/Graphics/ActivationKey.png")

func _process(delta: float) -> void:
	pass


	
func pickup_item(itemName:String):
	current_item=itemName;
	var items = $ItemSprite
	if(current_item=="NONE"):
		items.texture = null
	else:
		var itemN = current_item+".png"
		items.texture = load("res://Ui_Components/art/inventory_sprites/"+itemN)
	
