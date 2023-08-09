extends AudioStreamPlayer
var GLOBAL_NODES = preload("res://Assets/Resources/global_nodes.tres")

@export var bpm = 115
@export var measures = 4

@onready var beat_timer = $BeatTimer

signal beat

# Tracking the beat and song position. 
var sec_per_beat = 60.0 / bpm
var beats_before_start = 0 
var song_position_in_beats = 1


func _ready():
	sec_per_beat = 60.0 / bpm
	GLOBAL_NODES.song_conductor = self 

func _exit_tree():
	GLOBAL_NODES.song_conductor = null 
	
func _start_song(): 
	play()
	beat_timer.wait_time = sec_per_beat
	beat_timer.start()

func _on_beat_timer_timeout():
	beat_timer.wait_time = sec_per_beat
	beat_timer.start()
	_report_beat()
	
func _report_beat(): 
	emit_signal("beat") 
	pass
	


	
