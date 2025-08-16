extends CharacterBody2D

@export var speed = 100
@export var cooldownInFrames = 180

var cooldownRemaining = 0
var year = 2000
signal time_travel(year: int)

func emit_time_travel(yearValue: int):
	time_travel.emit(yearValue)

func handle_time_travel():
	if (cooldownRemaining > 0):
		cooldownRemaining -= 1
		return
	if not Input.is_action_just_released("time_travel"):
		return

	# Handle Scan

	if (year == 2000):
		set_collision_mask_value(3, true)
		set_collision_mask_value(2, false)
		year = 3000
		emit_time_travel(3000)
	elif (year == 3000):
		set_collision_mask_value(3, false)
		set_collision_mask_value(2, true)
		year = 2000
		emit_time_travel(2000)

	cooldownRemaining = cooldownInFrames
	




func handle_movement_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed


func _physics_process(_delta):
	handle_time_travel()
	handle_movement_input()
	move_and_slide()
