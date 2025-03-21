extends Area2D
class_name key1

@onready var info_num_1: CanvasLayer = $info_num_1
@onready var num_1: Label = $info_num_1/texture/ajuste/num_1

func _on_body_entered(body: Node2D) -> void:
	num_1.text = str(Global.key_1)
	print("será?")
	info_num_1.visible = true  

func _on_body_exited(body: Node2D) -> void:
	info_num_1.visible = false
