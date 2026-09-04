extends Node

var cave_screen = preload("res://screens/cave_screen/cave_screen.tscn")

func _ready():
	get_window().current_screen = 1
	get_window().mode = Window.MODE_FULLSCREEN
	var cave = cave_screen.instantiate()
	add_child(cave)
	self.title = "Cave"
	self.size = Vector2(1920, 1080)

func _on_close_requested() -> void:
	queue_free() # Frees the window instance
