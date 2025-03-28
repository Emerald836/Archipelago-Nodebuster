class_name BaseScene
extends Node2D

func vanilla_169186560_setup() -> void:
	pass


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func setup():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_169186560_setup, [], 943003185)
	else:
		vanilla_169186560_setup()
