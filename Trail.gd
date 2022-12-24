extends Line2D

var point
var color


func pastel_colors():
	randomize()
	var r = (randf() + 0.5) 
	var g = (randf() + 0.5)
	var b = (randf() + 0.5)
	return Color(r,g,b,0.15)

func _ready():
	color = pastel_colors()
	
	


func _physics_process(delta):
	
	default_color = color
	set_as_toplevel(true)
	point = get_parent().global_position + get_parent().rect_size/2
	add_point(point)
	width = get_parent().rect_size.x
	
	
	
	if points.size() > 25:
		remove_point(0)
