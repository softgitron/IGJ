extends Sprite2D


var char_tex = load("res://art/TeeleporterOff.png") 

func _ready():
	set_process_input(true)
	texture = char_tex

func switchOnOrOff(boolen1):
	if boolen1:
		texture = load("res://art/TeeleporterOn.png")
	else:
		texture=load("res://art/Teeleporteroff.png")
