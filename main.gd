extends Node2D

@onready var hud = $UiMain
@onready var player = $Player/Hand

func _ready() -> void:
	hud.connect_to_player(player)
