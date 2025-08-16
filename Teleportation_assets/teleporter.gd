class_name Teleporter
extends Area2D

@export var target: NodePath          
@export var exit_direction: Vector2  

var can_teleport: bool = true
@export var is_activated: bool = false


func set_active(state: bool) -> void:
	is_activated = state
	print("state: $is_active")
	var child = $TeleporterSprite
	child.switchOnOrOff(is_activated)
	

func _on_body_entered(body: Node) -> void:
	if not can_teleport or not is_activated:
		print("can't teleport")
		return
	
	if body.is_in_group("player") and target != null:
		var target_node = get_node_or_null(target)
		print("in teleport")
		if target_node and target_node is Teleporter:
			body.global_position = target_node.global_position
			if body.has_method("set_facing"):
				body.set_facing(exit_direction)
			
			can_teleport = false
			target_node.can_teleport = false

func _on_body_exited(body: Node) -> void:
	print("gone")
	if body.is_in_group("player"):
		# Allow teleporting again after leaving
		can_teleport = true
