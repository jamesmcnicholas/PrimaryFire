extends Node2D

var score = 0 setget set_score
var colour_set = ["#e53935", "#3949ab", "#fdd835"]
var current_colour

func _init():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_init_colour = rng.randi_range(-1, 2)
	
	change_colour(random_init_colour)

func _process(delta) -> void:
	if Input.is_action_just_pressed("change_colour_left"):
		change_colour(current_colour - 1)
	elif Input.is_action_just_pressed("change_colour_right"):
		change_colour(current_colour + 1)

func change_colour(colour_in_array):
	current_colour = cycle_colour(colour_in_array)
	VisualServer.set_default_clear_color(Color(colour_set[current_colour]))

func cycle_colour(array_number):
	if array_number < 0:
		return 2
	elif array_number > 2:
		return 0
	else:
		return array_number

func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(score))
