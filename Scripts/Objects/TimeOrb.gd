extends Node2D

@export var GravityArea = Area2D
@export var CollectionArea = Area2D
@onready var gameMaster = get_node("/root/GameMaster") as GameMaster # Getting our gamemaster.

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if (CollectionArea as Area2D).has_overlapping_bodies():
		var bodies = (CollectionArea as Area2D).get_overlapping_bodies()
		if(bodies[0]):
			gameMaster.globalTimerAdd(2)
			queue_free() # GONE
	
	if (GravityArea as Area2D).has_overlapping_bodies():
		var bodies = (GravityArea as Area2D).get_overlapping_bodies()
		if(bodies[0]):
			position = position.move_toward(bodies[0].position, 64 / position.distance_to(bodies[0].position))
