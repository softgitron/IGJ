extends Node2D

@onready var hud = $UiMain
@onready var player_hand = $Player/Hand
@onready var player = $Player


func _ready() -> void:
	hud.connect_to_players_hands(player_hand)
	hud.connect_to_player(player)
