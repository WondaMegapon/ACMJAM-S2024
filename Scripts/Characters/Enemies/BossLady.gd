extends CharacterBody2D

const MOVE_DURATION = 4.0  # time to move in one direction
const SHOOT_DURATION = 0.5 # Time between shots.
const ATTACK_VARIANCE = 8.0 # Range of attack.

@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.
var rng = RandomNumberGenerator.new()

var move_timer = MOVE_DURATION
var shoot_timer = 0
var shoot_count = 0

func _physics_process(delta):
	if(gameMaster.currentState != GameMaster.GameState.GAMEPLAY): return

	# Update movement direction
	move_timer -= delta
	shoot_timer -= delta
	
	if move_timer <= 0 and shoot_count <= 0:
		($AnimatedSprite2D as AnimatedSprite2D).play("sendMobs")
		move_timer = rng.randf_range(MOVE_DURATION, MOVE_DURATION * 1.5)
		shoot_count = rng.randi_range(1, 6)
	
	if (shoot_count > 0) and shoot_timer <= 0:
		var skull = load("res://Objects/Characters/Enemies/Skulljectile.tscn").instantiate()
		(skull as CharacterBody2D).velocity.y += shoot_count * ATTACK_VARIANCE * sin(shoot_count)
		skull.position.x += 32
		add_child(skull)
		shoot_timer = SHOOT_DURATION
		shoot_count -= 1
		if(shoot_count == 0): ($AnimatedSprite2D as AnimatedSprite2D).play("bossWTF")
	
	move_and_slide()
