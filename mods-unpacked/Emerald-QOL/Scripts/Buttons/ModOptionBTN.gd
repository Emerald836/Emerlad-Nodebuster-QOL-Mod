class_name ModOptionButton
extends Control


const MOD_OPTIONS = preload("res://mods-unpacked/Emerald-QOL/Scenes/ModOptions.tscn")
@onready var mod_button = $TextButton

var main: QOLMain

func _ready():
	mod_button.pressed.connect(_on_options_pressed)



func _on_options_pressed() -> void:
	var modOptionScene = MOD_OPTIONS.instantiate()
	modOptionScene.main = main
	Refs.popups.add_popup(modOptionScene)
	Refs.popups.focus_curr()
