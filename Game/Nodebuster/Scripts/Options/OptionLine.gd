@tool
class_name OptionLine
extends HBoxContainer

signal updated(id: String, val: int)

@export var options: Array[String] = [] :
	set(val):
		options = val
		if not is_node_ready(): await ready
		rebuild_popup()

@export var _option_name: String = "" :
	set(val):
		_option_name = val
		if not is_node_ready(): await ready
		option_name_label.text = _option_name

@export var option_id: String = ""

@onready var option_name_label: Label = %OptionName
@onready var option_picker: MenuButton = %OptionPicker
@onready var popup: PopupMenu = option_picker.get_popup()


func vanilla_1216213267__ready() -> void:
	popup.index_pressed.connect(_on_index_pressed)
	option_picker.mouse_entered.connect(_on_button_hovered)
	option_picker.pressed.connect(_on_button_pressed)
	rebuild_popup()

func vanilla_1216213267_rebuild_popup() -> void:
	popup.clear()
	for option_str: String in options:
		popup.add_item(option_str)

func vanilla_1216213267__on_index_pressed(idx: int) -> void:
	set_option(idx)
	updated.emit(option_id, idx)
	SFX.play(Sound.BUTTON_CLICK)

func vanilla_1216213267_set_option(idx: int) -> void:
	option_picker.text = popup.get_item_text(idx)
	# TODO: Actual option functionality

func vanilla_1216213267__on_button_hovered() -> void:
	SFX.play(Sound.BUTTON_HOVER, 0.2)

func vanilla_1216213267__on_button_pressed() -> void:
	SFX.play(Sound.BUTTON_CLICK)



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267__ready, [], 568540359)
	else:
		vanilla_1216213267__ready()


func rebuild_popup():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267_rebuild_popup, [], 1084038029)
	else:
		vanilla_1216213267_rebuild_popup()


func _on_index_pressed(idx: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267__on_index_pressed, [idx], 2949438011)
	else:
		vanilla_1216213267__on_index_pressed(idx)


func set_option(idx: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267_set_option, [idx], 1692544311)
	else:
		vanilla_1216213267_set_option(idx)


func _on_button_hovered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267__on_button_hovered, [], 707572310)
	else:
		vanilla_1216213267__on_button_hovered()


func _on_button_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1216213267__on_button_pressed, [], 2547131199)
	else:
		vanilla_1216213267__on_button_pressed()
