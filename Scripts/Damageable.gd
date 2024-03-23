extends Node
class_name Damageable
@onready var gameMaster = get_node("/root/GameMaster") # Getting our gamemaster.
@export var health : float = 2

func hit(damage: int):
	health -= damage
	
	if health <= 0:
		gameMaster.globalTimer += 3
		get_parent().queue_free()
