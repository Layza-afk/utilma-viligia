extends CanvasLayer

@onready var tentativas: Label = $texture/container/tentativas
@onready var timer_label: Label = $texture/container/temp

var time = Global.timer_counter

func _ready() -> void:
	Global.tent = 3
	time = Global.timer_counter

func _process(delta: float) -> void:
	tentativas.text = str(Global.tent) + "/3"

func _physics_process(delta: float) -> void:
	time = float(time) + delta
	format_time()
	
func format_time():
	var min = int(time)/60
	var segs = int(time) % 60
	var ms = int((time - int(time)) * 100)
	
	var string_time = str(min).pad_zeros(2) + "." + str(segs).pad_zeros(2) + "." + str(ms).pad_zeros(2)
	
	Global.timer_counter_string = string_time
	Global.timer_counter = time
	
	timer_label.text = string_time
