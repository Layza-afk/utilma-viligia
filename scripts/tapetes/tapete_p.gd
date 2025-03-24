extends Area2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var text_info_E: Sprite2D = $text_info

@onready var text_charada: Label = $CanvasLayer/text
@onready var texture_txt: ColorRect = $CanvasLayer/texture_txt

var can_interact: bool = false
var interface_open: bool = false

var lvls_charadas = {
	0: {
		"sala 1": "algo referente ao objeto da sala 1 da fase 0",
		"sala 2": "algo referente ao objeto da sala 2 da fase 0"
	},
	1: {
		"Sala 1": "algo referente ao objeto da sala 1 da fase 1",
		"Sala 2": "algo referente ao objeto da sala 1 da fase 1"
	},
	2: {
		"Sala 1": "algo referente ao objeto da sala 1 da fase 2",
		"Sala 2": "algo referente ao objeto da sala 1 da fase 2"
	}
}

func _on_body_entered(body: Node2D) -> void:
	text_info_E.visible = true
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	text_info_E.visible = false
	can_interact = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interativo"):
		if can_interact and not interface_open:
			open_interface()
	
		elif interface_open:
			close_interface()

func open_interface():
	canvas_layer.visible = true
	interface_open = true
	
	var current_charadas = lvls_charadas[Global.id_lvl]
	var texto_charadas = "Fase " + str(Global.id_lvl) + "\n"
	for sala in current_charadas.keys():
		texto_charadas += sala + ": " + current_charadas[sala] + "\n"
	
	text_charada.text = texto_charadas
	get_tree().paused = true

func close_interface():
	canvas_layer.visible = false
	interface_open = false
	get_tree().paused = false
