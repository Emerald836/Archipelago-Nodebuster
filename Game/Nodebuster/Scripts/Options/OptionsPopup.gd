class_name OptionsPopup
extends PanelContainer

signal back()

@onready var window_size: OptionLine = %WindowSize
@onready var options_vbox: VBoxContainer = %OptionsVBox

@onready var back_btn: TextButton = %BackBtn

func vanilla_2012335570__ready() -> void:
	back_btn.pressed.connect(_on_back)
	
	var resolution: Vector2i = DisplayServer.screen_get_size()
	var game_res: Vector2i = Vector2i(480, 270)
	var scale_factor: int = 1
	while game_res*scale_factor < resolution:
		scale_factor += 1
	
	var resolution_strings: Array[String] = ["fullscreen"]
	for i: int in range(1, scale_factor+1):
		resolution_strings.append("%dx%d" % [game_res.x*i,
				game_res.y*i])
	window_size.options = resolution_strings
	
	for child: Control in options_vbox.get_children():
		if child.has_signal("updated"):
			child.connect("updated", _on_option_updated)
		if child.has_method("set_option"):
			child.set_option(OptionData.get_option(child.option_id))

func vanilla_2012335570__on_option_updated(option_id: String, val) -> void:
	OptionData.update_option(option_id, val)
	OptionData.apply_option(option_id, val)

func vanilla_2012335570__on_back() -> void:
	back.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2012335570__ready, [], 1451191494)
	else:
		vanilla_2012335570__ready()


func _on_option_updated(option_id: String, val):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2012335570__on_option_updated, [option_id, val], 1331702028)
	else:
		vanilla_2012335570__on_option_updated(option_id, val)


func _on_back():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2012335570__on_back, [], 569887486)
	else:
		vanilla_2012335570__on_back()
