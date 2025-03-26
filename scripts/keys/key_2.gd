extends Area2D
class_name key2

@onready var num_2: Label = $info_num_2/texture/ajuste/num_2
@onready var info_num_2: CanvasLayer = $info_num_2

@onready var textura_item_2: Sprite2D = $textura_item_2

var itens_sprits = {
	0: preload("res://assets/itens/principais/item-abaco.png"),
	1: preload("res://assets/itens/principais/item-coliseu.png"),
	2: preload("res://assets/itens/principais/item-mascara.png")
}

func _ready() -> void:
	var index_texture = itens_sprits[Global.id_lvl]
	textura_item_2.texture = index_texture

func _on_body_entered(body: Node2D) -> void:
	num_2.text = str(Global.key_2)
	print("será?")
	info_num_2.visible = true  

func _on_body_exited(body: Node2D) -> void:
	info_num_2.visible = false
