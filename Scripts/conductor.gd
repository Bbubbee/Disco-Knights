extends AudioStreamPlayer

@export var bpm = 115
@export var measures = 4

@onready var beat_timer = $BeatTimer

# Tracking the beat and song position. 
var sec_per_beat = 60.0 / bpm
var beats_before_start = 0 
var song_position_in_beats = 1


func _ready():
	sec_per_beat = 60.0 / bpm

func start_song(): 
	play()
	beat_timer.wait_time = sec_per_beat
	beat_timer.start()

func _on_beat_timer_timeout():
	beat_timer.wait_time = sec_per_beat
	beat_timer.start()
	report_beat()
	
func report_beat(): 
	pass
