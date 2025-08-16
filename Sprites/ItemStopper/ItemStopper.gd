extends StaticBody2D

var stopper_active_texture = load("res://Sprites/ItemStopper/Graphics/ItemStopperActive.png")
var stopper_disabled_texture = load("res://Sprites/ItemStopper/Graphics/ItemStopperDisabled.png")

func _ready():
	Signals.connect('player_has_items', _on_player_has_items)

func _on_player_has_items(boolean: bool) -> void:
	$CollisionShape2D.disabled = !boolean
	if boolean:
		$Sprite2D.texture = stopper_active_texture
	else:
		$Sprite2D.texture = stopper_disabled_texture
