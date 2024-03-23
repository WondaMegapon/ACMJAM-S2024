extends CharacterBody2D
@onready var gameMaster = get_node("/root/GameMaster") as GameMaster # Getting our gamemaster.
@export var ShopArea : Area2D
var shopStock = 1 # Number of items in the shop

func _physics_process(delta):
	if Input.is_action_pressed("player_interact"):
		if ShopArea and (ShopArea as Area2D).has_overlapping_bodies():
			interactWithShop()

func interactWithShop():
	print("In shop range")
	if shopStock > 0:
		print("Buying item from shop")
		gameMaster.globalTimer += 30
		shopStock -= 1
		print("Item bought. Shop stock remaining:", shopStock)
		if shopStock == 0:
			print("Shop is out of stock")
