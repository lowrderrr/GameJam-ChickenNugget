extends Node

#@onready var main_menu: AudioStreamPlayer = $MainMenu
#@onready var button: AudioStreamPlayer = $Button

var json_audio
var audios = {}
func _ready() -> void:
	json_audio = Utils.get_JSON("res://MainGame/Global/JSON/AudioPath.json")
	for i in json_audio:
		audios[i] = load(json_audio[i])
	
func play_local(audio_stream: AudioStreamPlayer2D, audio_name):
	if !audio_stream.playing:
		audio_stream.stream = audios[audio_name]
		audio_stream.play()

func stop_local(audio_stream: AudioStreamPlayer2D):
	if audio_stream.playing:
		audio_stream.stop()
