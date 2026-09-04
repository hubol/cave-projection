extends Node2D

# Pen:
# Draws lines with mouse input

@onready var _lines: Node2D = $Line2D

var _current_line: Line2D = null

func _ready():
	pass

static func _create_line():
	var line_color = Global.get_drawing_color()
	var width = Global.tool_size
	
	var line = Line2D.new()
	line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	line.end_cap_mode = Line2D.LINE_CAP_ROUND
	line.joint_mode = Line2D.LINE_JOINT_ROUND
	
	line.default_color = line_color
	line.width = width
	
	return line

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			_current_line = _create_line()
			_lines.add_child(_current_line)
		else:
			_current_line = null
			
	if event is InputEventMouseMotion and _current_line:
		_current_line.add_point(event.position)
