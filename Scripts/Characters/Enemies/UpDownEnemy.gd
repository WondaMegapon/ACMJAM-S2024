extends CharacterBody2D

const SPEED = 100.0
const INTERVAL = 2.0

var timer = 0.0
var direction = 1

func _physics_process(delta):
	timer += delta

	# Check if it's time to change direction
	if timer >= INTERVAL:
		timer = 0
		direction = -direction

	# Calculate vertical velocity
	velocity.y = direction * SPEED

	move_and_slide()
