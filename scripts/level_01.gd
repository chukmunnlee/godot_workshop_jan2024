extends Node2D

@onready var ninja_frog = $NinjaFrog

func _ready():
	var start_pos: Array = get_tree().get_nodes_in_group("start_pos")
	var the_one = start_pos.pick_random()
	ninja_frog.global_position = the_one.global_position

func _on_dead_zone_body_entered(body):
	print("entered dead zone", body)
	get_tree().reload_current_scene()
