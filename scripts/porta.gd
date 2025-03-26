extends Area2D

@onready var slot_num: CanvasLayer = $slot_num

@onready var slot_1: LineEdit = $slot_num/ajust_p/ajuste/slot_1
@onready var slot_2: LineEdit = $slot_num/ajust_p/ajuste/slot_2

var path = "res://cenas/Fases/fase_"

var num_1
var num_2

func _ready() -> void:
	Global.random_keys()
	
	num_1 = str(Global.key_1)
	num_2 = str(Global.key_2)

func _on_body_entered(body: Node2D) -> void:
	slot_num.visible = true

func _on_body_exited(body: Node2D) -> void:
	slot_num.visible = false

func _on_button_pressed() -> void:
	if slot_1.text == num_1 and slot_2.text == num_2:
		if Global.id_lvl < 3:
			Global.id_lvl +=1
			print(Global.id_lvl)
			get_tree().change_scene_to_file(path + str(Global.id_lvl) + ".tscn")
		else:
			get_tree().change_scene_to_file("res://cenas/UI/creditos.tscn")
	else:
		print("Os números estão incorretos.")
