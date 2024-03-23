extends Area2D

@export var damage: int = 1

func _physics_process(delta):
	if Input.is_action_just_pressed("player_slash"):
		monitoring = true
	else:
		monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage))
