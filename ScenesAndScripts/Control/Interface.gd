extends Control

var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")
var player 
@onready var lifebar = $Lifebar

func _ready():
	player = GLOBAL_NODES.player
	if not player:
		return
		
	_get_signals()
	lifebar._initialize(player.max_hp)

func _get_signals():
	if not player.someda.connect(_on_Player_health_changed):
		print("failed to get signal")
		
	
func _on_Player_health_changed(new_health): 
	print("health changed")
	lifebar._change_health(new_health)
	


