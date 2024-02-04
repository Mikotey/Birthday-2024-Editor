class_name AudioSettingsControl
extends Control


@export_group("UI Elements")
@export var master_slider: Slider
@export var music_slider: Slider
@export var sfx_slider: Slider
@export var fauna_slider: Slider

@export_group("Audio Players")
@export var music_sample_player: AudioStreamPlayer2D # TODO: DELETE WHEN NO LONGER NEEDED
@export var sfx_sample_player: AudioStreamPlayer2D
@export var fauna_sample_player: AudioStreamPlayer2D

@export_group("Audio Samples")
@export var sfx_samples: AudioSamples
@export var fauna_samples: AudioSamples
@export var tone_sample: AudioStream # TODO: DELETE WHEN NO LONGER NEEDED

var _gm: GameMaster


func revert_changes():
	var audio = _gm.user_prefs.audio
	
	master_slider.value = audio.master
	music_slider.value = audio.music
	sfx_slider.value = audio.sfx
	fauna_slider.value = audio.fauna


func _on_fauna_slider_value_changed(value: float):
	_gm.audio_controller.set_fauna_volume(value)


func _on_master_slider_value_changed(value: float):
	_gm.audio_controller.set_master_volume(value)


func _on_music_slider_value_changed(value: float):
	_gm.audio_controller.set_music_volume(value)


func _on_sfx_slider_value_changed(value: float):
	_gm.audio_controller.set_sfx_volume(value)


func _play_sample(stream: AudioStream, player: AudioStreamPlayer2D):
	pass


#region Node

func _ready():
	_gm = get_node("/root/GlobalGameMaster")
	
	revert_changes()
	
	master_slider.value_changed.connect(_on_master_slider_value_changed)
	music_slider.value_changed.connect(_on_music_slider_value_changed)
	sfx_slider.value_changed.connect(_on_sfx_slider_value_changed)
	fauna_slider.value_changed.connect(_on_fauna_slider_value_changed)


#endregion Node
