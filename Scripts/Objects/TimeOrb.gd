extends Node2D

@export var CollectionArea = Area2D

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if (CollectionArea as Area2D).has_overlapping_bodies():
		var bodies = (CollectionArea as Area2D).get_overlapping_bodies()
		transform.interpolate_with(bodies[0].transform, 0.1)
