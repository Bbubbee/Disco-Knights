extends Node2D


func _ready():
	randomize() 
	$Conductor._start_song()
