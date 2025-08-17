class_name Player
extends CharacterBody2D

const FUTURE_YEAR = 3000
const PRESENT_YEAR = 2000
const FUTURE_COLLISION_ID = 3
const PRESENT_COLLISION_ID = 2

@export var speed = 500
@export var cooldown_in_frames = 180

var cooldown_remaining = 0
var current_year = PRESENT_YEAR
var status="yes"
signal time_travel(year: int)
signal tell_travel_status(status: String)


func _process(delta: float) -> void:

	if(not cooldown_remaining>0):
		var bol = scan_for_temporal_anomalies()
		if(bol):
			tell_travel_status.emit("no")
		else:
			tell_travel_status.emit("yes")	
	
	

func emit_time_travel(year_value: int):
	time_travel.emit(year_value)

func handle_time_travel():
	if (cooldown_remaining > 0):
		cooldown_remaining -= 1
		tell_travel_status.emit("cooldown")
		return
	if not Input.is_action_just_released("time_travel"):
		return

	# Handle Scan
	if (scan_for_temporal_anomalies()):
		print("Colliding, can't travel")
		return

	if (current_year == PRESENT_YEAR):
		change_collision_on_year(FUTURE_YEAR)
		emit_time_travel(FUTURE_YEAR)

		change_scanning_year(PRESENT_YEAR)
		current_year = FUTURE_YEAR

	elif (current_year == FUTURE_YEAR):
		change_collision_on_year(PRESENT_YEAR)
		emit_time_travel(PRESENT_YEAR)

		change_scanning_year(FUTURE_YEAR)
		current_year = PRESENT_YEAR
		
	cooldown_remaining = cooldown_in_frames

func change_collision_on_year(new_year: int):
	if (new_year == FUTURE_YEAR):
		set_collision_mask_value(FUTURE_COLLISION_ID, true)
		set_collision_mask_value(PRESENT_COLLISION_ID, false)
		return
	set_collision_mask_value(FUTURE_COLLISION_ID, false)
	set_collision_mask_value(PRESENT_COLLISION_ID, true)


func change_scanning_year(target_year: int):
	if (target_year == FUTURE_YEAR):
		$TemporalScanner.set_collision_mask_value(FUTURE_COLLISION_ID, true)
		$TemporalScanner.set_collision_mask_value(PRESENT_COLLISION_ID, false)
		return
	$TemporalScanner.set_collision_mask_value(FUTURE_COLLISION_ID, false)
	$TemporalScanner.set_collision_mask_value(PRESENT_COLLISION_ID, true)

	
func scan_for_temporal_anomalies():
	if $TemporalScanner.has_overlapping_bodies() or $TemporalScanner.has_overlapping_areas():
		return true
	return false

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
