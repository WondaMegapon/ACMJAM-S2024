extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const MOVE_DURATION = 4.0  # time to move in one direction

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_timer = MOVE_DURATION
var Unstuck = JUMP_VELOCITY
var direction = 1  # 1 for right, -1 for left
var gamePaused = false
func _physics_process(delta):
	if(gamePaused): return
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.x == 0:
		velocity.y = JUMP_VELOCITY

	# Update movement direction
	move_timer -= delta
	if move_timer <= 0:
		direction *= -1  # change direction
		move_timer = MOVE_DURATION

	velocity.x = direction * SPEED

	move_and_slide()
	
func _process(delta):
	if(Input.is_action_just_pressed("player_pause")):
		gamePaused = not gamePaused
