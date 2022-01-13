extends Node2D

export var team = 0
export var planet_size = 0
var max_strength = 30
var strength = 5
var raise_interval setget set_raise_interval

onready var sprite = $Sprite
onready var label = $Label
onready var timer = $Timer


func _ready():
	var size = 0.05 * planet_size
	sprite.set_scale(Vector2(0.14 + size * planet_size, 0.14 + size * planet_size))
	update_team(team)
	max_strength = 30 + (10 * planet_size)
	set_raise_interval(4 - planet_size)
	if team == 0:
		set_raise_interval(raise_interval * 2)


func _process(delta):
	label.text = str(strength)


func set_raise_interval(value):
	value = 4 - value
	timer.wait_time = value
	raise_interval = value


func _on_Timer_timeout():
	add_troops(1)


func add_troops(value):
	strength = min(strength + value, max_strength)


func take_damage(damage, attacker):
	if attacker != team:
		strength -= damage
	else:
		strength += damage
	if strength < 0:
		update_team(attacker)
		strength = -strength


func update_team(value):
	team = value
	sprite.set_frame_coords(Vector2(1, team))
	set_raise_interval(planet_size)
