extends KinematicBody

export(float) var mouse_sensitivity = 0.5

onready var camera = $Camera

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= mouse_sensitivity * event.relative.x
		camera.rotation_degrees.x -= mouse_sensitivity * event.relative.y
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
