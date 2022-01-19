extends Node2D

onready var ring = $RingSprite
onready var upgrades = $Upgrades
onready var actions = $Actions
onready var attack_sizes = $AttackSizes
onready var animation_player = $AnimationPlayer

var star = null


func show_actions(star_selected):
	star = star_selected
	self.position = star.position
	animation_player.play("show_actions")


func hide_actions():
	animation_player.play("hide_options")
	star = null


func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		for attack in attack_sizes.get_children():
			attack.set_visible(star.storage)
		animation_player.play("show_attacks")


func _on_UpgradeArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		animation_player.play("show_upgrades")


func _on_StationUpgrade_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		star.start_build("Station")
		animation_player.play("hide_options")


func _on_FirepowerUpgrade_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		star.start_build("Firepower")
		animation_player.play("hide_options")


func _on_FactoryUpgrade_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		star.start_build("Factory")
		animation_player.play("hide_options")


func _on_TechUpgrade_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		star.start_build("Technology")
		animation_player.play("hide_options")


func _on_Attack10_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 10)


func _on_Attack20_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 20)


func _on_Attack30_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 30)


func _on_Attack40_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 40)


func _on_Attack50_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 50)


func _on_Attack60_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		get_tree().call_group("Nebulae", "set_attack_action", 60)
