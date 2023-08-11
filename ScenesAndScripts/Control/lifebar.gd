extends HBoxContainer

@onready var health_bar = $HealthBar
@onready var health_count = $Health/Count
var maximum_health: int = 0 
var current_health: int = 0

func _initialize(health: int): 
	maximum_health = health
	current_health = maximum_health
	
	health_bar.max_value = maximum_health
	health_bar.value = maximum_health
	
	health_count.text = "%s / %s" % [maximum_health, maximum_health]
 

func _change_health(health): 
	health_bar.value = health
