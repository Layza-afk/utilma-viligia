extends Node

var id_lvl: int = 0

var tent: int = 3

var timer_counter = 0
var timer_counter_string = '0'

var keys = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var key_1: int = 0
var key_2: int = 0

func random_keys():
	randomize()
	
	key_1 = keys[randi() % keys.size()]
	key_2 = keys[randi() % keys.size()]
	
	print(Global.key_1, Global.key_2)
