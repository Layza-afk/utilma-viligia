extends Area2D
class_name key1

@onready var info_num_1: CanvasLayer = $info_num_1
@onready var num_1: Label = $info_num_1/texture/ajuste/num_1

@onready var textura_item_1: Sprite2D = $textura_item_1

var itens_sprits = {
	0: preload("res://assets/itens/principais/item-piramide.png"),
	1: preload("res://assets/itens/principais/item-olimpiadas.png"),
	2: preload("res://assets/itens/principais/item-brasão.png")
}

func _ready() -> void:
	var index_texture = itens_sprits[Global.id_lvl]
	textura_item_1.texture = index_texture

func _on_body_entered(body: Node2D) -> void:
	num_1.text = str(Global.key_1)
	print("será?")
	info_num_1.visible = true  

func _on_body_exited(body: Node2D) -> void:
	info_num_1.visible = false
