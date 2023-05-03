extends CharacterBody2D

@export var move_speed: int = 50
@onready var animation = $AnimationPlayer

func handle_input():
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", )
	velocity = move_direction * move_speed

func update_animation():
	var direction = "S"
	if velocity.x < 0:
		if velocity.y < 0: direction = "NW"
		elif velocity.y > 0: direction = "SW"
		else: direction = "W"
	elif velocity.x > 0:
		if velocity.y < 0: direction = "NE"
		elif velocity.y > 0: direction = "SE"
		else: direction = "E"
	elif velocity.y < 0: direction = "N"
	
	animation.play("standard_run_" + direction)

func _physics_process(_delta):
	handle_input()
	update_animation()
	move_and_slide()
