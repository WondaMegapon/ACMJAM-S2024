extends Area2D

@export var damage: int = 3
const SPEED  = 500
var velocity = Vector2()
func _ready():
	pass
func _physics_process(delta):
	velocity.x = SPEED * delta * scale.x
	translate(velocity)
	$AnimatedSprite2D.play("shoot")


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage))
