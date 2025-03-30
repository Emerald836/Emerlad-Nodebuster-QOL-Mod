class_name ModOptionButton
extends Control


const MOD_OPTIONS = preload("res://mods-unpacked/Emerald-QOL/Scenes/ModOptions.tscn")
var mod_button

var main: Node

func _ready():
	mod_button = get_child(0)
	if ModLoaderMod.is_mod_loaded("Emerald-QOL"):
		mod_button.main_color = Color.RED
	if mod_button.pressed.is_connected(_on_options_pressed) == false: mod_button.pressed.connect(_on_options_pressed)




func _on_options_pressed() -> void:
	var modOptionScene = MOD_OPTIONS.instantiate()
	modOptionScene.main = main
	Refs.popups.add_popup(modOptionScene)
	Refs.popups.focus_curr()

