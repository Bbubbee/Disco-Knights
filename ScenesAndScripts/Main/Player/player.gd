extends Node2D

var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")
@onready var animation_player = $AnimationPlayer
signal hp_changed
# For parrys. 
@onready var parry_timer = $ParryTimer
var taking_damage

# Health. 

signal test_sig
var max_hp: int = 100
var hp: int = max_hp


func _ready():
	GLOBAL_NODES.player = self
	GLOBAL_NODES.enemy.contacting_player.connect(_on_contacting_player)
	

func _input(event):
	if event.is_action_pressed("left"):
		animation_player.play("attack_left")
		
	elif event.is_action_pressed("right"):
		animation_player.play("attack_right")
	
	
func _on_contacting_player(_direction):
	parry_timer.start()
	taking_damage = true

func _on_animation_player_animation_finished(_anim_name):
	animation_player.play("RESET")
	

func _on_parry_timer_timeout():
	# Too late for parry. Take damage.
	if taking_damage:
		print("take damage!")
	else:
		print("parried!")

func _parry(): 
	taking_damage = false
	
func _take_damage(damage: int):
	print("take damage!")
	hp -= max(hp-damage, 0)
	
