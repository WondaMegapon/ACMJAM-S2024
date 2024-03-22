extends Node2D

var moveSpeed = 60 # The speed of the character
var jumpHeight = 3 # The impulse force of the character, when jumping.
var dashLength = 5 # The impulse force of the character, when dashing.
var gravity = -9.81 # The gravity of the character.
var gravityCap = -100
var drag = 0.85 # The inverse drag on the character.

var momentum = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# momentum *= drag # Slowing the character down when there's no input.
	var horizontalInput = Input.get_axis("player_left", "player_right") # Our input
	momentum.x += horizontalInput * moveSpeed # Adding in our input.
	#if(not transform.origin.y >= 200): momentum.y -= gravity
	transform.origin += momentum * delta # Applying momentum.
