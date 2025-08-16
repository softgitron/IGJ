extends CharacterBody2D

@export var normal_speed = 30
@export var catch_speed = 60
@export var turn_speed = 50
@export var targets: Array[Node2D]

var speed = normal_speed
var current_target = 0
var player_target: Player

func _physics_process(delta):
	if $NavigationAgent2D.is_navigation_finished():
		current_target += 1
	if current_target >= targets.size():
		current_target = 0
	
	if player_target:
		$NavigationAgent2D.target_position = player_target.position
	else:
		$NavigationAgent2D.target_position = targets[current_target].position

	var target_postion = $NavigationAgent2D.get_next_path_position()
	var new_velocity = position.direction_to(target_postion)
	velocity = velocity.lerp(new_velocity, delta * turn_speed).normalized() * speed
	
	move_and_slide()


func _on_player_detection_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		player_target = area.get_parent()
		speed = catch_speed

   
func _on_player_loose_area_exited(area: Area2D) -> void:
	if area.get_parent() is Player:
		player_target = null
		speed = normal_speed


func _on_kill_player_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		get_tree().paused = true
