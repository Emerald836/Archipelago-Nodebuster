class_name PrestigePicker
extends PanelContainer

signal back()

@onready var prestige_text: Label = %PrestigeText
@onready var down: TextButton = %Down
@onready var up: TextButton = %Up
@onready var info_btn: TextButton = %InfoBtn
@onready var start_btn: TextButton = %StartBtn
@onready var back_btn: TextButton = %BackBtn

var curr_prestige: int

func vanilla_3060425838__ready() -> void:
	down.pressed.connect(_on_down_pressed)
	up.pressed.connect(_on_up_pressed)
	back_btn.pressed.connect(_on_back_pressed)
	info_btn.hovered.connect(_on_info_hovered)
	info_btn.unhovered.connect(_on_info_unhovered)

func vanilla_3060425838_setup() -> void:
	curr_prestige = clampi(State.curr_prestige, 0, 25)
	refresh_ui()

func vanilla_3060425838__on_down_pressed() -> void:
	curr_prestige -= 1
	State.curr_prestige = curr_prestige
	refresh_ui()

func vanilla_3060425838__on_up_pressed() -> void:
	curr_prestige += 1
	State.curr_prestige = curr_prestige
	refresh_ui()

func vanilla_3060425838_refresh_ui() -> void:
	prestige_text.text = "prestige\n%d" % curr_prestige
	up.set_enabled(curr_prestige < State.max_prestige and curr_prestige < 25)
	down.set_enabled(curr_prestige > 0)

func vanilla_3060425838__on_info_hovered() -> void:
	var txt: String = "Unlock a new prestige level when you beat the boss of the previous " +\
			"one.\nEach prestige level increases both enemy stats and resource gain."
	Refs.tooltip.set_text(txt)
	Refs.tooltip.center_above_or_below(info_btn)
func vanilla_3060425838__on_info_unhovered() -> void:
	Refs.tooltip.hide()

func vanilla_3060425838__on_back_pressed() -> void:
	back.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__ready, [], 386762850)
	else:
		vanilla_3060425838__ready()


func setup():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838_setup, [], 2507848287)
	else:
		vanilla_3060425838_setup()


func _on_down_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__on_down_pressed, [], 163504694)
	else:
		vanilla_3060425838__on_down_pressed()


func _on_up_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__on_up_pressed, [], 3741160099)
	else:
		vanilla_3060425838__on_up_pressed()


func refresh_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838_refresh_ui, [], 3875082266)
	else:
		vanilla_3060425838_refresh_ui()


func _on_info_hovered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__on_info_hovered, [], 994467009)
	else:
		vanilla_3060425838__on_info_hovered()


func _on_info_unhovered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__on_info_unhovered, [], 105736164)
	else:
		vanilla_3060425838__on_info_unhovered()


func _on_back_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3060425838__on_back_pressed, [], 2927465551)
	else:
		vanilla_3060425838__on_back_pressed()
