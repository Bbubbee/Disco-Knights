extends Area2D
class_name Hitbox

 
func _init():
	collision_layer = 2  # Is a hitbox collision. 
	collision_mask = 2   # And can detect hitboxes. 
	
	
func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(hitbox: Hitbox) -> void: 
	if not hitbox:
		return 
	
	if owner.has_method("_parry"): 
		owner._parry() 
