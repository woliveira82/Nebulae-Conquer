extends Node2D

enum {
	GRAY,
	YELLOW,
	GREEN,
	RED,
	BLUE
}
var team = GRAY
var strength = 10
var destiny = null
var speed = 100

onready var sprite = $Sprite


func _ready():
	sprite.set_frame(team)


func _process(delta):
	sprite.look_at(destiny.position)
	position += (destiny.position - global_position).clamped(speed * delta)
	update()
	if position == destiny.position:
		destiny.take_damage(10, team)
		queue_free()


func _draw():
	draw_line(Vector2.ZERO, destiny.position - global_position, Color(1.0, 1.0, 1.0, 0.6), 1.0, true)
