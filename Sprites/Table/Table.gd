class_name Table

extends Area2D

var shovel_texture = load("res://Items/Graphics/DevelopmentShovel.png")
var key_texture = load("res://Items/Graphics/ActivationKey.png")

var _item_name: Enums.ITEM_NAMES
@export var item_name : Enums.ITEM_NAMES :
	get :
		return _item_name
	set(value) :
		_item_name = value
		if is_node_ready():
			update_item_texture()

func _ready() -> void:
	update_item_texture()

func update_item_texture():
	match (item_name):
		Enums.ITEM_NAMES.NONE:
			$ItemDisplayer.texture = null
		Enums.ITEM_NAMES.SHOVEL:
			$ItemDisplayer.texture = shovel_texture
		Enums.ITEM_NAMES.TELEPORTER_KEY:
			$ItemDisplayer.texture = key_texture