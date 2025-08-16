extends CanvasLayer



func connect_to_player(player: Node):
	player.inventory_changed.connect(_on_player_inventory_change)

func _on_player_inventory_change(item: String):
	print(item)
	var child = $Control/UiInventory
	child.pickup_item(item)
