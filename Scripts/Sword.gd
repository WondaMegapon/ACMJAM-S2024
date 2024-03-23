extends Area2D

@export var damage: int = 1

func _on_body_entered(body):
	if Input.is_action_just_pressed("player_slash"):
		monitoring = true
		for child in body.get_children():
			if child is Damageable:
				child.hit(damage)
				print_debug(body.name + " took " + str(damage))
	else:
		monitoring = false
