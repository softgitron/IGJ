extends Node2D

@onready var player = $Player
@onready var hud = $UiMain

func _ready():
	hud.connect_to_player(player)
