extends CanvasLayer

var scene_name


func change_to(new_scene):
	scene_name = new_scene
	$AnimationPlayer.play('fade')


func _new_scene():
	get_tree().change_scene(scene_name)
