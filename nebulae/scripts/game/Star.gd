extends Node2D

export var team = 0
export var size = 0

onready var timer = $Timer
onready var sprite = $Sprite

var slots = []
export var storage : int = 15

var max_storage : int
var firepower : int
var next_build : String = ""
export var build_left : int


func _ready():
	_upgrade_stats()
	sprite.frame_coords = Vector2(0, team)


func _upgrade_stats():
	max_storage = 40 + (size * 20) + (slots.count("Station") * 10)
	firepower = 1 + slots.count("Firepower") * 3
	var wait_time = 4 - slots.count("Factory") * 0.5
	if team == 0:
		wait_time *= 2
	timer.wait_time = wait_time
	build_left = 8
	$Label.text = str(storage)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_tree().call_group("Nebulae", "star_touch", self)


func _on_Timer_timeout():
	if next_build == "":
		add_storage(1)
	else:
		build_left -= 1
		if build_left <= 0:
			add_build()


func add_storage(value):
	storage += value
	if storage > max_storage:
		storage = max_storage
	$Label.text = str(storage)


func sub_storage(value, fleet_team):
	storage -= value
	if storage < 0:
		storage *= -1
		team = fleet_team
		sprite.frame_coords = Vector2(0, team)
		get_tree().call_group("Nebulae", "verify_game_end")
	$Label.text = str(storage)


func start_build(upgrade: String):
	if slots.size() < 2 + size * 2:
		next_build = upgrade


func add_build():
	slots.append(next_build)
	next_build = ""
	_upgrade_stats()


func fleet_arrive(fleet_force, fleet_team):
	if team == fleet_team:
		add_storage(fleet_force)
	else:
		sub_storage(fleet_force, fleet_team)
