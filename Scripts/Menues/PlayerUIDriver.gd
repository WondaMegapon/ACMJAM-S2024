extends CanvasLayer

@onready var gameMaster = get_node("/root/GameMaster") as GameMaster
var previousState = GameMaster.GameState.MAIN_MENU

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	($Gameplay/Timer as Label).text = str(floor(gameMaster.globalTimer))
	
	if(previousState == gameMaster.currentState): return
	get_children().map(func(item): (item as CanvasItem).hide())
	match(gameMaster.currentState):
		GameMaster.GameState.GAMEPLAY:
			($Gameplay as CanvasItem).show()
			($Gameplay as Control).grab_focus()
		GameMaster.GameState.PAUSE_MENU:
			($Pause as CanvasItem).show()
			($Pause/Quit/Restart as Control).grab_focus()
		GameMaster.GameState.GAME_OVER:
			($Dead as CanvasItem).show()
			($Dead/Quit/Again as Control).grab_focus()
		_:
			pass
	previousState = gameMaster.currentState

func restart_scene():
	gameMaster.restart_scene()

func to_title():
	gameMaster._ready()
	gameMaster.currentState = GameMaster.GameState.MAIN_MENU
	get_tree().change_scene_to_file("res://Scenes/MainMenue.tscn")
