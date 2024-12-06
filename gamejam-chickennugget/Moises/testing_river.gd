extends Node2D

var t := 0.0
@export var number_of_icons: int = 1  # Number of icons to spawn initially
@onready var path = $Path2D


var icons = [
	preload("res://Moises/Coal.tscn"),
]

func _ready():
	randomize()  # Ensure randomness in each run
	# Optionally pre-spawn some icons

func _process(delta: float) -> void:
	# Update the progress of all PathFollow2D nodes
	for path_follow in path.get_children():
		if path_follow is PathFollow2D:
			path_follow.progress += delta * 100.0  # Adjust speed as needed
			# Remove icons that complete the path
			if path_follow.progress >= path.curve.get_baked_length():
				path_follow.queue_free()

	# Randomly spawn new icons
	if randf() < 0.0009:  # Adjust spawn chance
		spawn_icon()

func spawn_icon():
	var path_follow = PathFollow2D.new()
	path.add_child(path_follow)

	# Randomize which icon to spawn
	var random_icon_scene = icons[randi() % icons.size()]
	var new_icon = random_icon_scene.instantiate()

	path_follow.add_child(new_icon)
	path_follow.progress = 0.0  # Start at the beginning of the path
