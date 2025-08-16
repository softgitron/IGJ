extends Sprite2D

var teleporter_on = load("res://Sprites/Teleporter/Graphics/TeeleporterOn.png")
var teleporter_off = load("res://Sprites/Teleporter/Graphics/TeeleporterOff.png") 

func _ready():
	texture = teleporter_off

func active(status: bool):
	if status:
		texture = teleporter_on
	else:
		texture = teleporter_off
