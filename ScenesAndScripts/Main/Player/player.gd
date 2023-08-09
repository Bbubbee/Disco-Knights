extends Node2D

var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")
@onready var animation_player = $AnimationPlayer
@onready var parry_timer = $ParryTimer

var parry_direction: String = "none"
var attacked_direction: String = "null"
var taking_damage


func _ready():
	GLOBAL_NODES.enemy.contacting_player.connect(_on_contacting_player)
	pass
	
func _process(_delta):
	_check_parry()

func _input(event):
	if event.is_action_pressed("left"):
		animation_player.play("attack_left")
		parry_direction = "left"
		
	elif event.is_action_pressed("right"):
		animation_player.play("attack_right")
		parry_direction = "right"

func _check_parry(): 
#	print(attacked_direction+" "+parry_direction)
	if attacked_direction == parry_direction:
#		print("ding")
		taking_damage = false
		print(taking_damage)
	
	
func _on_contacting_player(direction):
	parry_timer.start()
	attacked_direction = direction 
	taking_damage = true

func _on_animation_player_animation_finished(_anim_name):
	animation_player.play("RESET")
	parry_direction = "none"
	

func _on_parry_timer_timeout():
	# Too late for parry. Take damage.
	if taking_damage:
		print("taking damage")
		taking_damage = false
	else:
		print("parried attack!")
