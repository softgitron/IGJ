extends Sprite2D

@export var physics_body: PhysicsBody2D

func handle_movement_input():
	rotation = physics_body.velocity.angle()


func _physics_process(_delta):
	handle_movement_input()
