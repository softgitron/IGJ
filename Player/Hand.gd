extends Area2D

var interactable_in_range: Node2D = null

var _item: Enums.ITEM_NAMES = Enums.ITEM_NAMES.NONE
@export var item : Enums.ITEM_NAMES :
	get :
		return _item
	set(value) :
		_item = value
		if (_item):
			Signals.emit_signal('player_has_items', true)
		else:
			Signals.emit_signal('player_has_items', false)

signal inventory_changed(item_name: String)

func handle_use_input():
	if not Input.is_action_just_released("use"):
		return
	if interactable_in_range is Table and interactable_in_range.visible == true:
		var table: Table = interactable_in_range
		if table.item_name != Enums.ITEM_NAMES.NONE:
			item = table.item_name
			table.item_name = Enums.ITEM_NAMES.NONE
		else:
			table.item_name = item
			item = Enums.ITEM_NAMES.NONE
			
	elif interactable_in_range is TeleporterConsole:
		var teleporterConsole: TeleporterConsole = interactable_in_range
		item = teleporterConsole.use(item)
	
	elif ((interactable_in_range is DiggableGround) and _item == Enums.ITEM_NAMES.SHOVEL):
		var ground: DiggableGround = interactable_in_range
		ground.use()
	emit_signal("inventory_changed",item)


func _physics_process(_delta):
	handle_use_input()


func _on_area_entered(area: Area2D) -> void:
	if (area is Table or area is TeleporterConsole or area.is_in_group("interactable")):
		interactable_in_range = area


func _on_area_exited(area: Area2D) -> void:
	if (area is Table or area is TeleporterConsole or area.is_in_group("interactable")):
		interactable_in_range = null
