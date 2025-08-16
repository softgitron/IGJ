extends CanvasLayer


func connect_to_player(player: Node):
	player.inventory_changed.connect(_on_player_inventory_change)

func _on_player_inventory_change(item):
	var child = $Control/UiInventory
	var name = Enums.ITEM_NAMES.keys()[Enums.ITEM_NAMES.values().find(item)]
	child.pickup_item(name)
