extends Area2D

@export var item_name: String = "Watch"
@export var value: int = 1

signal picked_up( value)

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("picked_up", value)
		queue_free()
