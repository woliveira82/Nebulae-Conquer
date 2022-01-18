extends Node2D

export var team = 0
export var size = 0

onready var timer = $Timer

var slots = []
export var storage : int = 15

var max_storage : int
var firepower : int
var next_build : String = ""
export var build_left : int


func _ready():
	_upgrade_stats()


func _upgrade_stats():
	max_storage = 40 + (size * 20) + (slots.count("Station") * 10)
	firepower = 1 + slots.count("Firepower") * 3
	timer.wait_time = 4 - slots.count("Factory") * 0.2
	build_left = 8


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().call_group("Nebulae", "star_touch", self)


func _on_Timer_timeout():
	if next_build == "":
		storage += 1
		if storage > max_storage:
			storage = max_storage
		$Label.text = str(storage)
	else:
		build_left -= 1
		if build_left <= 0:
			add_build()


func start_build(upgrade: String):
	if slots.size() < 2 + size * 2:
		next_build = upgrade


func add_build():
	slots.append(next_build)
	next_build = ""
	_upgrade_stats()


func attack(target, attack_force):
	pass
