extends Area2D

@export var item_name: String = "Keycard"

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.pickup_item(item_name)
		queue_free()
		  


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
