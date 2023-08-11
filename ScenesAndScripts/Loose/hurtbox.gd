extends Area2D
class_name Hurtbox 


@export var damage: int =  10

func _init():
	collision_layer = 0
	collision_mask =  2  # Detects collisions. 
	

func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(hitbox: Hitbox): 
	if not hitbox: 
		return 
		
	if owner.has_method("take_damage"): 
		owner.take_damage(damage)  
