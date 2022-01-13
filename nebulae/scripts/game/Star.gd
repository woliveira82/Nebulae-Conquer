extends Node2D

var team = 0

export var size = 1
var slots = []
var defenses setget set_defenses
var max_defenses setget , get_max_defenses
var firepower setget , get_firepower
var production setget , get_production


func _on_Area2D_input_event(viewport, event, shape_idx):
	print('Input event here')


func set_defenses(value):
	defenses += value
	if defenses > get_max_defenses():
		defenses = get_max_defenses()
	elif defenses < 0:
		defenses = 0


func get_firepower():
	return 2


func get_max_defenses():
	return 80 * pow(1.5, size -1)


func get_production():
	return 100


func build():
	pass
