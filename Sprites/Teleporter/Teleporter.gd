class_name Teleporter
extends Area2D

@export var target: Teleporter          
@export var exit_direction: Vector2  

var can_teleport: bool = true

var _active: bool = false
@export var active : bool :
	get :
		return _active
	set(value) :
		_active = value
		if is_node_ready():
			update_active_status()


func update_active_status():
	var child = $TeleporterSprite
	child.active(active)


func _on_area_entered(area: Area2D) -> void:
	if not can_teleport or not active:
		return
	
	if target != null:
		area.get_parent().global_position = target.global_position
		
		can_teleport = false
		target.can_teleport = false


func _on_area_exited(_area: Area2D) -> void:
	can_teleport = true
