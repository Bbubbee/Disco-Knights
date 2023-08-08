extends Node2D


func _ready():
	randomize() 
	$Conductor.start_song()
