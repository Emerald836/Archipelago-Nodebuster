class_name GameMenu
extends PanelContainer

signal back()

@onready var main_menu_btn: TextButton = %MainMenuBtn
@onready var options_btn: TextButton = %OptionsBtn
@onready var back_btn: TextButton = %BackBtn

func vanilla_453098876__ready() -> void:
	main_menu_btn.pressed.connect(_on_main_menu_pressed)
	options_btn.pressed.connect(_on_options_pressed)
	back_btn.pressed.connect(_on_back)

func vanilla_453098876__on_main_menu_pressed() -> void:
	Refs.main_scn.enter_main_menu()
	Saver.save_game()
	Refs.popups.pop_curr()

func vanilla_453098876__on_options_pressed() -> void:
	Refs.popups.add_popup(Refs._options.instantiate())
	Refs.popups.focus_curr()

func vanilla_453098876__on_back() -> void:
	back.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_453098876__ready, [], 2243097584)
	else:
		vanilla_453098876__ready()


func _on_main_menu_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_453098876__on_main_menu_pressed, [], 3622974789)
	else:
		vanilla_453098876__on_main_menu_pressed()


func _on_options_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_453098876__on_options_pressed, [], 3378936120)
	else:
		vanilla_453098876__on_options_pressed()


func _on_back():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_453098876__on_back, [], 3962160296)
	else:
		vanilla_453098876__on_back()
