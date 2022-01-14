extends Node

var player_team
var campaign_phase
var upgrade = {
	"Technology": 500,
	"Firepower": 200,
	"Defenses": 100,
	"Factory": 100,
	"Radar": 500,
	"Warfleet": 200
}


func _ready():
	player_team = 1
	campaign_phase = null
