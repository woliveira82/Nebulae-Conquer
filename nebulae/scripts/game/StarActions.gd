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
#	upgrades.visible = false
#	actions.visible = true
#	attack_sizes.visible = false
#	self.visible = true


func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		actions.visible = false
		attack_sizes.visible = true


func _on_UpgradeArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and not event.pressed:
		animation_player.play("show_upgrades")


func _on_StationUpgrade_input_event(viewport, event, shape_idx):
	star.start_build("Station")
#	_hide_actions()


func _on_FirepowerUpgrade_input_event(viewport, event, shape_idx):
	star.start_build("Firepower")
#	_hide_actions()


func _on_FactoryUpgrade_input_event(viewport, event, shape_idx):
	star.start_build("Factory")
#	_hide_actions()


func _on_TechUpgrade_input_event(viewport, event, shape_idx):
	star.start_build("Technology")
#	_hide_actions()


func _hide_actions():
	self.visible = false
	self.position = star.position
	upgrades.visible = false
	actions.visible = true
	attack_sizes.visible = false
	star = null
