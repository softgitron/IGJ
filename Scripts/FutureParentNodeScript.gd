extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready():
	#time_travel.connect(_handle_time_travel_signal)
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_player_time_travel(year: int):
	if (year == 2000):
		visible = false
		update_children(false, self)
	if (year == 3000):
		visible = true
		update_children(true, self)

func update_children(status: bool, parent: Node):
	for child in parent.get_children():
		child.visible = status
		update_children(status, child)
