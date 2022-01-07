extends Node2D

var selected = false
onready var sprite = $Sprite


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		selected = true
		get_tree().call_group("selected_planets", "unselect")
		add_to_group("selected_planets")
		sprite.frame = 0


func unselect():
	selected = false
	sprite.frame = 1
	remove_from_group("selected_planets")
