class_name TeleporterConsole

extends Area2D

var key_texture = load("res://Items/Graphics/ActivationKey.png")

@export var teleporter_a: Teleporter
@export var teleporter_b: Teleporter

var active = false

func use(item: Enums.ITEM_NAMES) -> Enums.ITEM_NAMES:
	if active == false and item == Enums.ITEM_NAMES.TELEPORTER_KEY:
		active = true
		teleporter_a.active = true
		teleporter_b.active = true
		$ItemDisplayer.texture = key_texture
		return Enums.ITEM_NAMES.NONE
	elif active:
		active = false
		teleporter_a.active = false
		teleporter_b.active = false
		$ItemDisplayer.texture = null
		return Enums.ITEM_NAMES.TELEPORTER_KEY
	else:
		return item
