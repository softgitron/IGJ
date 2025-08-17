extends StaticBody2D

var television_texture = load("res://Items/Graphics/CrtTelevision.png")
var door_keycard_texture = load("res://Items/Graphics/KeycardDoor.png")
var door_locked_texture = load("res://Items/Graphics/LockedWoodenDoor.png")

@export var collision_layer_integer: int
@export var rotate_by_degrees : int = 0
@export var interactable_name : Enums.INTERACTABLE_NAMES:
	get :
		return interactable_name
	set(value) :
		interactable_name = value
		if is_node_ready():
			update_item_texture()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _ready() -> void:
	update_item_texture()
	update_item_collision_layer()

func update_item_texture():
	match (interactable_name):
		Enums.INTERACTABLE_NAMES.NONE:
			$InteractableSprite.texture = null
		Enums.INTERACTABLE_NAMES.CRT_TELEVISION:
			$InteractableSprite.texture = television_texture
			$CRTCollision.set_disabled(false)
		Enums.INTERACTABLE_NAMES.DOOR_KEYCARD:
			$InteractableSprite.texture = door_keycard_texture
			$DoorCollision.set_disabled(false)
		Enums.INTERACTABLE_NAMES.DOOR_LOCKED:
			$InteractableSprite.texture = door_locked_texture
			$DoorCollision.set_disabled(false)
	set_rotation_degrees(rotate_by_degrees)

func update_item_collision_layer():
	print("Collision layer set to")
	print(collision_layer_integer)
	set_collision_layer_value(collision_layer_integer, true)
