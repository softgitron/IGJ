extends Sprite2D

var hole_on = load("res://Sprites/DiggableGround/graphics/DirtHoleDug.png")
var hole_off = load("res://Sprites/DiggableGround/graphics/DirtHole.png") 

func _ready():
	texture = hole_off

func active(status: bool):
	if status:
		texture = hole_on
	else:
		texture = hole_off
