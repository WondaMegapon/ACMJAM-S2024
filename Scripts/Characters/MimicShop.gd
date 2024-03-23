extends CharacterBody2D

@export var ShopArea = Area2D
@onready var gameMaster = get_node("/root/GameMaster") as GameMaster # Getting our gamemaster.

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if (ShopArea as Area2D).has_overlapping_bodies():
		var bodies = (ShopArea as Area2D).get_overlapping_bodies()
		print("In shop range")
