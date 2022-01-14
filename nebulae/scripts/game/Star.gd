extends Node2D

export var team = 0
export var size = 1

var slots = []
var defenses : int setget set_defenses
var max_defenses : int
var firepower : int
var production : int


func _ready():
	_upgrade_stats()


func set_defenses(value: int):
	defenses += value
	if defenses > max_defenses:
		defenses = max_defenses
	elif defenses < 0:
		defenses = 0


func build(upgrade: String):
	slots.append(upgrade)
	_upgrade_stats()


func _upgrade_stats():
	var size_defenses = 80 * pow(1.5, size -1)
	var slots_defenses = 1 + slots.count("Defenses") / 10
	max_defenses = size_defenses * slots_defenses
	
	firepower = 2 + slots.count("Firepower") * 2
	
	production = slots.count("Factory") * 10 + 20


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().call_group("Nebulae", "star_touch", self)
