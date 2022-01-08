extends Node2D

var line_from = Vector2.ZERO
var line_to = Vector2.ZERO
var dragging = false
export var snap_distance = 50

onready var planet_list = $Planets.get_children()

func _ready():
	print(planet_list)

func _process(delta):
	update()


func _draw():
	if dragging:
		draw_line(line_from, line_to, Color(1.0, 1.0, 1.0, 0.4), 4, true)


func _input(event):
	if event is InputEventScreenTouch:
		dragging = event.pressed
		if event.pressed:
			line_from = _snap_to_planet(event.position)
			line_to = event.position
		else:
			line_to = _snap_to_planet(event.position)
	else:
		if dragging:
			line_to = _snap_to_planet(event.position)


func _snap_to_planet(position):
	for planet in planet_list:
		if position.distance_to(planet.global_position) < snap_distance:
			return planet.global_position
	return position
