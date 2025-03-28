class_name CreditsPopup
extends PanelContainer

signal back()

@onready var back_btn: TextButton = %BackBtn

func vanilla_1681721935__ready() -> void:
	back_btn.pressed.connect(_on_back)

func vanilla_1681721935__on_back() -> void:
	back.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1681721935__ready, [], 1266111235)
	else:
		vanilla_1681721935__ready()


func _on_back():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1681721935__on_back, [], 880948347)
	else:
		vanilla_1681721935__on_back()
