extends CharacterBody2D

const SPEED = 300.0

@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.

var direction = 1  # 1 for right, -1 for left

func _physics_process(delta):
	if(gameMaster.currentState != GameMaster.GameState.GAMEPLAY): return

	velocity.x = direction * SPEED
	$AnimatedSprite2D.play("charge")
	
	if ($DamageVolume as Area2D).has_overlapping_bodies():
		queue_free()
	
	move_and_slide()

func _process(delta):
	($AnimatedSprite2D as AnimatedSprite2D).flip_h = direction == 1
	
