extends CanvasLayer

var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")
var player 
@onready var hp_bar = $Control/HpBar


func _ready():

	GLOBAL_NODES.enemy.contacting_player.connect(_on_Player_health_changed)
	player = GLOBAL_NODES.player
	if not player:
		return
		
	_get_signals()

func _get_signals():
	pass

func _on_Player_health_changed(): 
	print("health changed")
