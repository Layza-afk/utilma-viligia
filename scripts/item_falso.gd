extends Area2D

@onready var textura: Sprite2D = $textura

var entrou: int = 3

var texture_false = [
	preload("res://assets/itens/falsos/bandeira.png"),
	preload("res://assets/itens/falsos/barco.png"),
	preload("res://assets/itens/falsos/espelho.png"),
	preload("res://assets/itens/falsos/jarro.png"),
	preload("res://assets/itens/falsos/ladrilho.png"),
	preload("res://assets/itens/falsos/leao.png"),
	preload("res://assets/itens/falsos/luz.png"),
	preload("res://assets/itens/falsos/poste.png"),
	preload("res://assets/itens/falsos/telefone.png")
]

func _ready() -> void:
	entrou = 3
	
	randomize()
	textura.texture = texture_false[randi() % texture_false.size()]

func _process(delta: float) -> void:
	if entrou == 0:
		get_tree().reload_current_scene()

func _on_body_entered(body: Node2D) -> void:
	if entrou <= 3 and entrou != 0:
		Global.tent -= 1
		entrou -= 1
