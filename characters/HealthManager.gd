extends Spatial

signal dead
signal hurt
signal healed
signal health_changed
signal gibbed

export var max_health = 100
var current_health = 1

export var gibbed_at = -20

func _ready() -> void:
	init()
	
func init():
	current_health = max_health
	emit_signal("health_changed", current_health)

func hurt(damage: int, direction: Vector3, damage_type="normal"):
	if current_health <= 0:
		return
	current_health -= damage
	if current_health <= gibbed_at:
		pass #TODO make gibs spawner
		emit_signal("gibbed")
	if current_health <= 0:
		emit_signal("dead")
	else:
		emit_signal("hurt")
	emit_signal("health_changed", current_health)

func heal(amount: int):
	if current_health <= 0:
		return
	current_health += amount
	if current_health > max_health:
		current_health = max_health
	emit_signal("healed")
	emit_signal("health_changed", current_health)
