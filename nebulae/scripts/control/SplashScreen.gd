extends ColorRect


func _ready():
	SceneDirector.change_to("res://nebulae/scenes/phase/Nebulae.tscn")
#	$AnimationPlayer.play('fade_in_out')


func _to_main_menu():
#	SceneDirector.change_to('res://src/scenes/control/MainMenu.tscn')
	SceneDirector.change_to("res://nebulae/scenes/phase/Nebulae.tscn")
