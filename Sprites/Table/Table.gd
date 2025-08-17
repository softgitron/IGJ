class_name Table

extends Area2D

var shovel_texture = load("res://Items/Graphics/Shovel.png")
var key_texture = load("res://Items/Graphics/ActivationKey.png")
var keycard_texture = load("res://Items/Graphics/Keycard.png")
var keycard_ultimate_texture = load("res://Items/Graphics/KeycardUltimate.png")
var playstation_texture = load("res://Items/Graphics/PS4.png")
var ps_controller_texture = load("res://Items/Graphics/PS4Controller.png")
var semtex_texture = load("res://Items/Graphics/Semtex.png")

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
			$ItemDisplayer.scale = Vector2(1,1)
			$ItemDisplayer.set_rotation_degrees(90)
		Enums.ITEM_NAMES.TELEPORTER_KEY:
			$ItemDisplayer.texture = key_texture
		Enums.PS_CONTROLLER:
			$ItemDisplayer.texture = ps_controller_texture
		Enums.KEYCARD:
			$ItemDisplayer.texture = keycard_texture
		Enums.KEYCARD_ULTIMATE:
			$ItemDisplayer.texture = keycard_ultimate_texture
		Enums.PLAYSTATION:
			$ItemDisplayer.texture = playstation_texture
		Enums.SEMTEX:
			$ItemDisplayer.texture = semtex_texture
		
