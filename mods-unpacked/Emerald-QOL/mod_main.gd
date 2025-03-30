extends Node
class_name QOLMain

var mod_data: Dictionary = {
	"speed_scale": 0,
	"show_resource": 0
}


var optionsPopup: OptionsPopup
const MOD_OPTION_BTN = preload("res://mods-unpacked/Emerald-QOL/Scenes/ModOptionBTN1.tscn")


var battleScene: BattleScene
const RESOURCE_COUNTS = preload("res://mods-unpacked/Emerald-QOL/Scenes/ResourceCounts.tscn")

func _ready():
	get_tree().node_added.connect(_node_added)
	get_tree().node_removed.connect(_node_removed)

func _node_added(node: Node) -> void:
	if node is OptionsPopup:
		optionsPopup = node
		node.ready.connect(_add_mod_menu_to_options.bind(node))
	if node is BattleScene:
		battleScene = node
		node.ready.connect(_add_resource_counts_to_battle_scene.bind(node))

func _node_removed(node: Node) -> void:
	if node is OptionsPopup:
		optionsPopup = null


func _add_resource_counts_to_battle_scene(battleScn:BattleScene) -> void:
	if mod_data["show_resource"] == 1: return
	var resourceScene = RESOURCE_COUNTS.instantiate()
	resourceScene.global_position = Vector2(10,50)
	battleScn.ui.call_deferred("add_child",resourceScene)


func _add_mod_menu_to_options(options:OptionsPopup) -> void:
	var modScene = MOD_OPTION_BTN.instantiate()
	modScene.main = self
	options.options_vbox.call_deferred("add_child",modScene)


func get_option(option_id: String) -> Variant:
	return mod_data.get(option_id, 0)

func apply_option(option_id: String, val) -> void:
	match option_id:
		"speed_scale":
			match val:
				0:
					Engine.time_scale = 1
				1:
					Engine.time_scale = 2
				2:
					Engine.time_scale = 2.5
				3:
					Engine.time_scale = 3
				4:
					Engine.time_scale = 4
		"show_resource":
			match val:
				0:
					pass
				1:
					pass

func update_option(option_id: String, val) -> void:
	mod_data[option_id] = val
