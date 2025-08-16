extends CharacterBody2D

@export var speed = 100
var currentItem: String = ""

signal inventory_changed(item_name: String)

func has_item(item_name:String)->bool:
	return currentItem==item_name
	
func remove_item()->String:
	var temp = currentItem
	currentItem=""
	return temp
	
func pickup_item(item_name:String)->void:
	if currentItem=="":
		currentItem=item_name
		emit_signal("inventory_changed", item_name)
	

func get_input():
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

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

func _physics_process(delta):
	get_input()
	move_and_slide()
