extends Area2D

var table_in_range: Table = null
var item = Enums.ITEM_NAMES.NONE


func handle_use_input():
	if not Input.is_action_just_released("use"):
		return
	if table_in_range:
		if table_in_range.item_name != Enums.ITEM_NAMES.NONE:
			item = table_in_range.item_name
			table_in_range.item_name = Enums.ITEM_NAMES.NONE
		else:
			table_in_range.item_name = item
			item = Enums.ITEM_NAMES.NONE


func _physics_process(_delta):
	handle_use_input()


func _on_area_entered(area: Area2D) -> void:
	if (area is Table):
		table_in_range = area


func _on_area_exited(area: Area2D) -> void:
	table_in_range = null
