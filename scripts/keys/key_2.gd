extends Area2D
class_name key2

@onready var num_2: Label = $info_num_2/texture/ajuste/num_2
@onready var info_num_2: CanvasLayer = $info_num_2

func _on_body_entered(body: Node2D) -> void:
	num_2.text = str(Global.key_2)
	print("será?")
	info_num_2.visible = true  

func _on_body_exited(body: Node2D) -> void:
	info_num_2.visible = false
