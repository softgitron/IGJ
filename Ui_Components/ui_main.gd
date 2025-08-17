extends CanvasLayer
@onready var hold_meter = $Control/PoliceMeter
@onready var hold_timer: Timer = $Control/HoldTimer

signal police_level(level:int)

var current_year:int = 2000
var current_item = ""

var present_list =["SHOVEL"]
var future_list = ["TELEPORTER_KEY"]

var item_list={
	"SHOVEL": 2000,
	"TELEPORTER_KEY":3000
}
var is_holding := false

var police_lvl=0
var kiikku = 0

func connect_to_players_hands(player: Node):
	player.inventory_changed.connect(_on_player_inventory_change)
	

func connect_to_player(player: Node):
	player.time_travel.connect(_player_time)
	player.tell_travel_status.connect(_set_status_light)
	

func _on_player_inventory_change(item):
	var child = $Control/UiInventory
	var name = Enums.ITEM_NAMES.keys()[Enums.ITEM_NAMES.values().find(item)]
	child.pickup_item(name)
	current_item=name
	check_holding_state()

#tells which era the players is in to the UI
func _player_time(new_year:int):
	current_year=new_year
	check_holding_state()

func _set_status_light(status:String):
	if status =="yes":
		$Control/InfoLight/StatusLight.modulate = Color(0, 1, 0)
		
	elif status =="no":
		$Control/InfoLight/StatusLight.modulate = Color(1,0 , 0)
		
	elif status =="cooldown":
		$Control/InfoLight/StatusLight.modulate = Color(0, 0, 1)
		
	

func _process(delta: float) -> void:
	if (hold_timer.time_left > 0 && is_holding):
		# Update meter smoothly as timer runs down
		hold_meter.value = hold_meter.max_value - hold_timer.time_left
	else:
		if(hold_meter.value>0):
			kiikku += delta/3
			if(kiikku>0.1):
				hold_meter.value -=kiikku
				kiikku=0
			



func start_hold():
	hold_timer.wait_time = hold_meter.max_value- hold_meter.value
	hold_timer.start()

func stop_hold():
	hold_timer.stop()

func _on_hold_timer_timeout():
	print("Meter full → reset now")
	hold_meter.value = 0
	upgrade_level()
	start_hold()
	
func _handle_watch_pickup(strength):
	if(police_lvl!=0):
		police_lvl -=strength
		if(police_lvl<0):
			police_lvl=0
		police_level.emit(police_lvl)
	$Control/PoliceLevel.text = str(police_lvl)

func upgrade_level():
	hold_meter.value =0
	if(police_lvl!=10):
		police_lvl+=1
	police_level.emit(police_lvl)
	$Control/PoliceLevel.text = str(police_lvl)

#checks base
func check_holding_state() -> void:
	if(item_list.get(current_item, 0) !=0 && item_list.get(current_item, 0) !=current_year):
		is_holding=true
		start_hold()
		
	else:
		stop_hold()
		is_holding=false
