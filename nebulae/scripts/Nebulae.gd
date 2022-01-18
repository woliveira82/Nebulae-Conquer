extends Node2D

var current_phase
var stars
var player_team
var star_selected
var action_selected
var attack_force = 0

onready var star_actions = $StarActions
var FighetFleet = preload("res://nebulae/scenes/game/FighterFleet.tscn")


func _ready():
	star_selected = null
	player_team = GameControl.player_team
	_instantiate_current_phase(GameControl.campaign_phase)


func star_touch(star):
	if not action_selected:
		star_selected = star
		star_actions.show_actions(star)
	elif action_selected == "attack":
		_create_attack_fleet(star_selected, star)


func _instantiate_current_phase(phase):
	var CurrentPhase
	if not phase:
		CurrentPhase = preload("res://nebulae/scenes/phase/Phase_00.tscn")
	else:
		var phase_path = "res://nebulae/scenes/phase/Phase_%02d.tscn"
		CurrentPhase = load(phase_path % phase)
	
	current_phase = CurrentPhase.instance()
	stars = current_phase.find_node("Stars").get_children()
	add_child(current_phase)


func _verify_game_end():
	var one_player_star = false
	var other_player_star = false
	for star in stars:
		if star.team == player_team:
			one_player_star = true
		else:
			other_player_star = true

	if not one_player_star:
		print('YOU LOSE')
	
	if not other_player_star:
		print('YOU WIN')
 

func set_attack_action(attack):
	attack_force = attack
	action_selected = "attack"


func _create_attack_fleet(attacker, target):
	attacker.storage -= attack_force
	var fighter_fleet = FighetFleet.instance()
	fighter_fleet.position = attacker.position
	fighter_fleet.destiny = target
	fighter_fleet.strength = attack_force
	add_child(fighter_fleet)
