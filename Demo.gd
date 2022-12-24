extends Node2D

var dot = preload("res://Dot.tscn")
onready var slider = get_node("Container/value_selector")
onready var text_label = get_node("Container/Label")
onready var screen = get_viewport_rect().size
var dot_count = 100

func _ready():
	slider.value = dot_count
	text_label.text = str(dot_count) + " Dots."
	remove_all()
	initialise(dot_count)
#	yield(get_tree().create_timer(5.0), "timeout")
#	remove_all()




func remove_all() -> void:
	for child in get_children():
		if child is Dot:
			child.queue_free()

func initialise(count:int) -> void:
	
	for _x in range(count):
		
		add_child(dot.instance())
	
	for child in get_children():
		if child is Dot:	
			randomize()
			child.position = Vector2(randf()*screen.x,randf()*screen.y)
			child.velocity.y = child.velocity.y if randf() < 0.5 else -child.velocity.y
			child.velocity.x = child.velocity.x if randf() < 0.5 else -child.velocity.x


func _on_value_selector_value_changed(value):
	text_label.text = str(value) + (" Dots." if value != 1 else " Dot.")


func _on_Button_pressed():
	dot_count = slider.value
	text_label.text = str(slider.value) + (" Dots." if slider.value != 1 else " Dot.")
	remove_all()
	initialise(dot_count)
