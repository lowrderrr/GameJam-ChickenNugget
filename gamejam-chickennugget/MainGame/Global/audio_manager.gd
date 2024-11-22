extends Node

#@onready var main_menu: AudioStreamPlayer = $MainMenu
#@onready var button: AudioStreamPlayer = $Button
var get_audio
var dic_audio = {}
func _ready() -> void:
	get_audio = Utils.get_JSON("res://MainGame/Global/JSON/AudioPath.json")
	for i in get_audio:
		dic_audio[i] = load(get_audio[i])
	play("Test")
	
func play(name_audio):
	#Test
	$Sound.stream = dic_audio[name_audio]
	$Sound.play()
		
func stop():
	$Sound.stop()
