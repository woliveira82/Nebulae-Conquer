extends Node2D

const SpaceShip = preload("res://nebulae/scenes/game/SpaceShip.tscn")

enum {
	PRESS,
	DRAG,
	RELEASE
}

onready var planet_list = $Planets.get_children()
onready var ships = $Ships

var line_from = Vector2.ZERO
var line_to = Vector2.ZERO
var origin_planet
var destiny_planet
var dragging = false

export var snap_distance = 50


func _ready():
	print(planet_list)


func _process(delta):
	update()


func _draw():
	if dragging and line_from:
		draw_line(line_from, line_to, Color(1.0, 1.0, 1.0, 0.4), 4, true)


func _input(event):
	if event is InputEventScreenTouch:
		dragging = event.pressed
		if event.pressed:
			line_from = _snap_to_planet(event.position, PRESS)
			line_to = event.position
		else:
			line_to = _snap_to_planet(event.position, RELEASE)
	else:
		if dragging:
			line_to = _snap_to_planet(event.position, DRAG)


func _snap_to_planet(position, action):
	for planet in planet_list:
		if position.distance_to(planet.global_position) < snap_distance:
			if action == PRESS:
				origin_planet = planet
				destiny_planet = null
				return planet.global_position
			elif action == DRAG:
				return planet.global_position
			else:
				destiny_planet = planet
				if origin_planet != destiny_planet and origin_planet != null:
					_create_attack_fleet(origin_planet, destiny_planet)
				return planet.global_position
	if action == PRESS:
		origin_planet = null
		return null
	return position


func _create_attack_fleet(origin, destiny):
	if origin.strength > 10:
		origin.strength -= 10
		var space_ship = SpaceShip.instance()
		space_ship.position = origin.position
		space_ship.destiny = destiny
		space_ship.team = origin.team
		ships.add_child(space_ship)
