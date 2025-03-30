class_name ModOptions
extends PanelContainer

signal back()

@onready var back_btn = %BackBtn
@onready var options_vbox = %OptionsVBox

var main: QOLMain

func _ready():
	back_btn.pressed.connect(_on_back)
	
	for child: Control in options_vbox.get_children():
		if child.has_signal("updated"):
			child.connect("updated", _on_option_updated)
		if child.has_method("set_option"):
			child.set_option(main.get_option(child.option_id))
		#if child.has_method("set_option"):
		#	child.set_option(OptionData.get_option(child.option_id))


func _on_option_updated(option_id: String, val) -> void:
	main.update_option(option_id, val)
	main.apply_option(option_id, val)

func _on_back():
	back.emit()
