extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * (1 if Input.is_action_pressed("player_jump") else 2 )

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y += JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_left", "player_right")
	
	if Input.is_action_just_pressed("player_dash"):
		velocity.x -= JUMP_VELOCITY * 2 * direction * (1.5 if is_on_floor() else 1)
	
	velocity.x = move_toward(velocity.x, direction * SPEED, 100)

	move_and_slide()
