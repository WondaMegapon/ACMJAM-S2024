extends Node
class_name Damageable
@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.
@export var health : float = 2
var damageTimer = 0;

signal on_damage
signal on_kill

func hit(damage: int):
	health -= damage
	damageTimer = 1
	on_damage.emit()
	
	if health <= 0:
		on_kill.emit()
		gameMaster.globalTimer += 3
		get_parent().queue_free()

func _process(delta):
	if(damageTimer > 0):
		damageTimer -= delta
		(get_parent().find_child("AnimatedSprite2D") as AnimatedSprite2D).modulate = Color(2, sin(damageTimer * 32), sin(damageTimer * 32))
	else: (get_parent().find_child("AnimatedSprite2D") as AnimatedSprite2D).modulate = Color.WHITE
