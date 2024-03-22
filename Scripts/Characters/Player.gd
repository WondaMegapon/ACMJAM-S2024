extends CharacterBody2D

const SPEED = 500.0 # The movement speed of the character.
const JUMP_VELOCITY = -600.0 # The impulse jump force of the character.
const DASH_MAX_COOLDOWN = 0.5 # The max cooldown of the dash
const MAX_IFRAMES = 0.7 # The max iframes on the character.

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dashCooldown = 0 # The cooldown of the dash.
var iframes = 0 # 

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
	
	# Handling the input gained from dashing.
	if Input.is_action_just_pressed("player_dash") and dashCooldown <= 0:
		velocity.x -= JUMP_VELOCITY * 2 * direction * (1.5 if is_on_floor() else 1.0)
		dashCooldown = DASH_MAX_COOLDOWN # Resetting cooldown.
	
	# Drag on horizontal momentum.
	velocity.x = move_toward(velocity.x, direction * SPEED, 100)
	
	# Decreasing the cooldown.
	if(dashCooldown >= 0): dashCooldown -= delta
	
	# Moving~
	move_and_slide()
