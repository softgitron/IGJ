extends CharacterBody2D

@export var target: Node2D
@export var speed: float = 10
@export var turn_speed: float = 10

func _ready() -> void:
	# Assume HUD is a sibling or somewhere in the tree
	var hud = get_node("/root/Main/UiMain")
	hud.police_level.connect(_increase_speed)

func _physics_process(delta):
	var new_velocity = position.direction_to(target.position)
	velocity = velocity.lerp(new_velocity, delta * turn_speed).normalized() * speed
	move_and_slide()

func _increase_speed(level:int):
	speed += level*3
	turn_speed+= level

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() == target:
		get_tree().change_scene_to_file("res://Menus/GameOverMenu.tscn")
