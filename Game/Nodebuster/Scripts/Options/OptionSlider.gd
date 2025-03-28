@tool
class_name OptionSlider
extends HBoxContainer

signal updated(id: String, val: int)

@export var _option_name: String = "" :
	set(val):
		_option_name = val
		if not is_node_ready(): await ready
		option_name_label.text = _option_name

@export var option_id: String = ""

@onready var option_name_label: Label = %OptionName
@onready var slider: HSlider = %HSlider
@onready var slider_val: Label = %SliderVal

func vanilla_3566940910__ready() -> void:
	slider.value_changed.connect(_on_slider_value_changed)
	slider.mouse_entered.connect(_on_slider_hovered)
	slider.drag_started.connect(_on_drag_started)
	slider.drag_ended.connect(_on_drag_ended)

func vanilla_3566940910__on_slider_value_changed(value: float) -> void:
	slider_val.text = str(value)
	updated.emit(option_id, int(value))

func vanilla_3566940910_set_option(val: int) -> void:
	slider.value = val

func vanilla_3566940910__on_slider_hovered() -> void:
	SFX.play(Sound.BUTTON_HOVER, 0.2)

func vanilla_3566940910__on_drag_started() -> void:
	Globals.lock_mouse(self)
	SFX.play(Sound.BUTTON_DOWN)

func vanilla_3566940910__on_drag_ended(value_changed: bool) -> void:
	Globals.unlock_mouse(self)
	SFX.play(Sound.BUTTON_UP)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910__ready, [], 4081006306)
	else:
		vanilla_3566940910__ready()


func _on_slider_value_changed(value: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910__on_slider_value_changed, [value], 1034374737)
	else:
		vanilla_3566940910__on_slider_value_changed(value)


func set_option(val: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910_set_option, [val], 429112530)
	else:
		vanilla_3566940910_set_option(val)


func _on_slider_hovered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910__on_slider_hovered, [], 1753869464)
	else:
		vanilla_3566940910__on_slider_hovered()


func _on_drag_started():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910__on_drag_started, [], 1003707901)
	else:
		vanilla_3566940910__on_drag_started()


func _on_drag_ended(value_changed: bool):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3566940910__on_drag_ended, [value_changed], 3403515206)
	else:
		vanilla_3566940910__on_drag_ended(value_changed)
