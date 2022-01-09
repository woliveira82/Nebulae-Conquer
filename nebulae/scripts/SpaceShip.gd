extends Node2D

onready var sprite = $Sprite
var destiny = Vector2.ZERO
export var speed = 100


func _process(delta):
	sprite.look_at(destiny)
	position += (destiny - global_position).clamped(speed * delta)
	update()
	if position == destiny:
		queue_free()


func _draw():
	draw_line(Vector2.ZERO, destiny - global_position, Color(1.0, 1.0, 1.0, 0.6), 1.0, true)
	
#func RotatePlayer(start, finish):
#    var angle = start.angle_to_point(finish)
#    set_rot(angle)
