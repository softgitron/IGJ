extends Node2D

@onready var hud = $UiMain
@onready var player_hand = $Player/Hand
@onready var player = $Player


func _ready() -> void:
	hud.connect_to_players_hands(player_hand)
	hud.connect_to_player(player)
	for item in get_tree().get_nodes_in_group("pickups"):
		item.connect("picked_up", Callable(hud, "_handle_watch_pickup"))
