extends CharacterBody2D

@export var speed = 1100

func _ready() -> void:
	print("sada")

func handle_movement_input():

	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite2D.animation = "right"
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite2D.animation = "left"
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$AnimatedSprite2D.animation = "down"
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$AnimatedSprite2D.animation = "up"
	print(velocity)
	if velocity.length() > 0:
		velocity = velocity * speed
		
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()


func _physics_process(_delta):
	handle_movement_input()
	move_and_slide()
