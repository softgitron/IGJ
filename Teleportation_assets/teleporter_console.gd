extends Area2D

@export var teleporter_a: NodePath
@export var teleporter_b: NodePath
@export var required_item: String = "Keycard"

var player_inside := false

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("interact"):
		
		var t1 = get_node_or_null(teleporter_a)
		var t2 = get_node_or_null(teleporter_b)
		var player = get_tree().get_first_node_in_group("player")
		if t1 and t2:
			print(player.has_item(required_item))
		if required_item == "" or (player and player.has_item(required_item)):
			if t1 and t2:
				print("teleporterChnaged")
				var new_state = !t1.is_activated
				t1.set_active(new_state)
				t2.set_active(new_state)

func _on_body_entered(body: Node) -> void:
	print("in console")
	if body.is_in_group("player"):
		player_inside = true

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_inside = false
