extends CanvasLayer
@onready var hold_meter = $PoliceMeter
var current_year:int = 2000
var current_item = ""

var item_list = {"NONE":0, "SHOVEL":2000, "TELEPORTER_KEY":3000}

func connect_to_players_hands(player: Node):
	player.inventory_changed.connect(_on_player_inventory_change)
	

func connect_to_player(player: Node):
	player.time_travel.connect(_player_time)

func _on_player_inventory_change(item):
	var child = $Control/UiInventory
	var name = Enums.ITEM_NAMES.keys()[Enums.ITEM_NAMES.values().find(item)]
	child.pickup_item(name)
	current_item=item
	check_holding_state()

#tells which era the players is in to the UI
func _player_time(new_year:int):
	current_year=new_year
	check_holding_state()

var hold_time := 0.0
var max_hold_time := 5.0
var is_holding := false

var timeHoldingContraband=0

func _process(delta: float) -> void:
	if is_holding:
		hold_time = clamp(hold_time + delta, 0, max_hold_time)
	else:
		hold_time = clamp(hold_time - delta, 0, max_hold_time)
	hold_meter.value = hold_time / max_hold_time * hold_meter.max_value

#checks base
func check_holding_state():
	if current_item in item_list:
		is_holding=true
	else:
		is_holding=false
