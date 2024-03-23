extends Node
class_name Damageable
@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.
@export var health : float = 2
var damageTimer = 0;

func hit(damage: int):
	health -= damage
	damageTimer = 1
	
	if health <= 0:
		gameMaster.globalTimer += 3
		get_parent().queue_free()

func _process(delta):
	if(damageTimer > 0):
		damageTimer -= delta
		(get_parent().get_child(3) as AnimatedSprite2D).modulate = Color(2, sin(damageTimer * 32), sin(damageTimer * 32))
	else: (get_parent().get_child(3) as AnimatedSprite2D).modulate = Color.WHITE
