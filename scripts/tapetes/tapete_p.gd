extends Area2D

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var text_info_E: Sprite2D = $text_info

@onready var text_charada: Label = $CanvasLayer/text
@onready var texture_txt: ColorRect = $CanvasLayer/texture_txt
@onready var interrogar: AnimatedSprite2D = $"?"


var can_interact: bool = false
var interface_open: bool = false

var lvls_charadas = {
	0: {
		"sala 1": "Sou uma construção gigante, com lados triangulares que tocam o céu. \nDentro demim, descansa a realeza de tempos atrás. Quem sou?",
		"\nsala 2": "Sou um objeto utilizado para calcular e medir. Na arquitetura e comércio, \nminha utilidade era sem preceder. Quem sou?"
	},
	1: {
		"Sala 1": "Sou uma competição atlética, iniciada em terra grega. \nEntre Zeus e a chama eterna, sou tradição que nunca seca. Quem sou?",
		"\nSala 2": "Construí estradas e aquedutos, meu império não tinha igual. \nGovernava terras vastas, dos Alpes ao mar Mediterrâneo afinal. Quem sou?"
	},
	2: {
		"Sala 1": "Fui iniciado como um chamado por terras sagradas, cruzando desertos \ne mares em jornadas ousadas. Meu objetivo: recuperar o que foi perdido. Quem sou?",
		"\nSala 2": "Eu trouxe terror à Idade Média, com doença e desespero \npor onde passava. Fiz reis e camponeses igualmente padecer. Quem sou?"
	}
}

func _on_body_entered(body: Node2D) -> void:
	text_info_E.visible = true
	interrogar.visible = false
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
