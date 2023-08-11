extends Node2D
class_name Enemy

var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")
@onready var animation_player = $AnimationPlayer
var attacking = false 

signal contacting_player(direction: String) 

# Specify the time each attack makes contact. 
# This is so the enemy attacks on beat. 
var attacks = {
	"attack_right": 0.5,
	"attack_left" : 0.5
}


func _ready():
	GLOBAL_NODES.song_conductor.beat.connect(_on_conductor_beat)
	GLOBAL_NODES.enemy = self

func _exit_tree():
	GLOBAL_NODES.enemy = null
	
#	var animation_length = animation_player.get_animation("attack_right").length
#	print(str(animation_length))
	
func _process(_delta):
#	if animation_player.animation_finished:
#		attacking = false
	pass

# The conductor has played a beat. 
func _on_conductor_beat(): 
	_make_decision()
#	print("beat")

# Decide if and where to attack. 
func _make_decision(): 
	if not attacking: 
		attacking = true 		
		attack()

func attack(): 
	# Randomly choose a direction to attack. 
	var att = attacks.keys()[randi() % attacks.size()]
	
	# Attack on the next beat. Sync the contact of the attack with the next beat. 
	var wait_length = float(att) + GLOBAL_NODES.song_conductor.sec_per_beat
	await get_tree().create_timer(wait_length).timeout 
	
	# Attack! 
	animation_player.play(att)	
	await animation_player.animation_finished
	attacking = false

func _contacting_player(direction): 
	emit_signal("contacting_player", direction)

