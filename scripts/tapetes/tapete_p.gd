extends Area2D

@onready var text_info: Sprite2D = $text_info
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var can_interact: bool = false
var interface_open: bool = false

func _on_body_entered(body: Node2D) -> void:
	text_info.visible = true
	can_interact = true

func _on_body_exited(body: Node2D) -> void:
	text_info.visible = false
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
	get_tree().paused = true
	
func close_interface():
	canvas_layer.visible = false
	interface_open = false
	get_tree().paused = false
