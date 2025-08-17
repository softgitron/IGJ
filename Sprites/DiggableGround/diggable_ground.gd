class_name DiggableGround
extends Area2D

@export var target: DiggableGround       
@export var exit_direction: Vector2  

var can_teleport: bool = true
var save_char: Area2D = null

var _active: bool = false
@export var active : bool :
	get :
		return _active
	set(value) :
		_active = value
		if is_node_ready():
			update_active_status()

func use() -> void:
	active = true
	target.active = true
	update_active_status()

func update_active_status():
	var child = $GroundSprite
	child.active(active)

func _on_area_entered(area: Area2D) -> void:
	if not can_teleport or not active:
		return
	if target != null and visible:
		area.get_parent().global_position = target.global_position
		if(active):
			can_teleport = false
			target.can_teleport = false


func _on_area_exited(_area: Area2D) -> void:
	can_teleport = true
