extends Node

var globalTimer = 60.0 # The timer itself.

enum GameState {MAIN_MENU, PAUSE_MENU, GAMEPLAY, CUTSCENE, GAME_OVER} # Tracking possible states.
var currentState = GameState.MAIN_MENU # The current state.

# For adding time to the timer.
func globalTimerAdd(value: int):
	globalTimer += value
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	globalTimer = 60.0 # Resetting~
	currentState = GameState.GAMEPLAY
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(currentState == GameState.GAMEPLAY): # If we're currently video gaming.
		if(globalTimer <= 0): # If we hit zero...
			currentState = GameState.GAME_OVER
		if(globalTimer >= 0):
			globalTimer -= delta # Subtracting time.

func restart_scene():
	get_tree().reload_current_scene() # No more sceeene~
	_ready()
