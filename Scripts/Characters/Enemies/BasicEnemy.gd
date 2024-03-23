extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
const MOVE_DURATION = 4.0  # time to move in one direction

@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_timer = MOVE_DURATION
var Unstuck = JUMP_VELOCITY
var direction = 1  # 1 for right, -1 for left

func _physics_process(delta):
	if(gameMaster.currentState != GameMaster.GameState.GAMEPLAY): return
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.x == 0:
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	# Update movement direction
	move_timer -= delta
	if move_timer <= 0:
		direction *= -1  # change direction
		move_timer = MOVE_DURATION

	velocity.x = direction * SPEED
	$AnimatedSprite2D.play("walk")
	
	move_and_slide()
	
