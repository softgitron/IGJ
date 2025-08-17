extends StaticBody2D

var stopper_active_texture = load("res://Sprites/ItemStopper/Graphics/ItemStopperActive.png")
var stopper_disabled_texture = load("res://Sprites/ItemStopper/Graphics/ItemStopperDisabled.png")
var stopper_disabled_fully_texture = load("res://Sprites/ItemStopper/Graphics/ItemStopperDisabledFully.png")
var disabled_fully = false

func _ready():
	Signals.connect('player_has_items', _on_player_has_items)
	Signals.connect('endGame', _on_player_has_items)
	
func _disable_fully():
	disabled_fully=true
	$Sprite2D.texture = stopper_disabled_fully_texture
	$CollisionShape2D.disabled = true

func _on_player_has_items(boolean: bool) -> void:
	if(disabled_fully):
		return
	$CollisionShape2D.disabled = !boolean
	if boolean:
		$Sprite2D.texture = stopper_active_texture
	else:
		$Sprite2D.texture = stopper_disabled_texture
