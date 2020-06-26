extends Spatial

var body_to_move: KinematicBody = null

export var move_acceleration = 4
export var max_speed = 25
var drag = 0.0
export var jump_force = 30
export var gravity = 60

var pressed_jump = false
var move_vector: Vector3
var velocity: Vector3
var snap_vector: Vector3
export var ignore_rotation = false

signal movement_info

var frozen = false

func _ready() -> void:
	drag = float(move_acceleration) / max_speed

func init(_body_to_move: KinematicBody):
	body_to_move = _body_to_move

func jump():
	pressed_jump = true

func set_move_vector(_move_vector: Vector3):
	move_vector= _move_vector.normalized()
	
func _physics_process(delta: float) -> void:
	pass
