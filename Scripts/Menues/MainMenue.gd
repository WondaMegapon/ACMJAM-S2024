extends Node2D

@onready var gameMaster = get_node("/root/GameMaster") as GameMaster

func _ready():
	($Control/Quit/Play as Control).grab_focus()

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	gameMaster.restart_scene()
