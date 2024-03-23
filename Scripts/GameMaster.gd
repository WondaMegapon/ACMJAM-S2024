extends Node

var globalTimer = 60.0 # The timer itself.

enum GameState {MAIN_MENU, PAUSE_MENU, GAMEPLAY, GAME_OVER, INTRO_SCENE, OUTRO_SCENE} # Tracking possible states.
var currentState = GameState.MAIN_MENU # The current state.
var firstStart = true

# For adding time to the timer.
func globalTimerAdd(value: int):
	globalTimer += value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(currentState)
	if(currentState == GameState.GAMEPLAY): # If we're currently video gaming.
		if(globalTimer <= 0): # If we hit zero...
			currentState = GameState.GAME_OVER
		if(globalTimer >= 0):
			globalTimer -= delta # Subtracting time.

func restart_scene():
	get_tree().reload_current_scene() # No more sceeene~
	globalTimer = 60.0
	currentState = GameState.GAMEPLAY if not firstStart else GameState.INTRO_SCENE
	firstStart = false
