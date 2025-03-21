extends Area2D

var entrou: int = 1

func _ready() -> void:
	entrou = 1

func _on_body_entered(body: Node2D) -> void:
	if entrou == 1:
		Global.tent -= 1
		entrou -= 1
