extends Node2D

@onready var cam_p: Camera2D = $sala_p/cam_p
@onready var cam_s_1: Camera2D = $sala_1/cam_S1

# sala principal
func _on_area_detec_p_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		cam_p.current = false

#Sala secundaria 1
func _on_area_detec_s_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		cam_s_1.current = true
		
