class_name Dot
extends Node2D

onready var screen = get_viewport_rect().size

const rect_size = Vector2(0.5,0.5)
func _draw():
	draw_rect(Rect2(Vector2(0,0),rect_size),Color("fff"))
	
	
var velocity
var speed

func _ready():
	randomize()
	speed = (randf() * 30) + 20
	
	velocity = Vector2(speed,speed)
	
	position = Vector2(screen.x/2,screen.y/2)

func _process(delta):
	if position.y > screen.y - rect_size.y or position.y < 0:
		velocity.y = -velocity.y 
	if position.x > screen.x - rect_size.x or position.x < 0:
		velocity.x = -velocity.x
	
	position += velocity * delta

