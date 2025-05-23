extends CharacterBody2D
class_name Human_Body

var movement_speed = 10000

var low_end_scale = 0.3
var high_end_scale = 0.5
var low_end_point = 470
var high_end_point = 837


@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
var move_target: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var movement_unit_vector: Vector2 = Vector2(0, 0)
	if Input.is_action_pressed("up"):
		movement_unit_vector.y = -1
	elif Input.is_action_pressed("down"):
		movement_unit_vector.y = 1
	
	if Input.is_action_pressed("left"):
		movement_unit_vector.x = -1
	elif Input.is_action_pressed("right"):
		movement_unit_vector.x = 1
	
	if not nav_agent.is_navigation_finished():
		var next_pos = nav_agent.get_next_path_position()
		movement_unit_vector = (next_pos - global_position).normalized()
	
	velocity = movement_unit_vector * movement_speed * delta
	move_and_slide()
	
	var new_scale = find_scale()
	scale = Vector2(new_scale, new_scale)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		set_move_target(get_global_mouse_position())

func set_move_target(target_pos: Vector2) -> void:
	nav_agent.set_target_position(target_pos)
	print("1")

func find_scale():
	var scale_factor: float = (position.y - low_end_point) / (high_end_point - low_end_point)
	return low_end_scale + ((high_end_scale - low_end_scale) * scale_factor)
