class_name TypingLabel
extends Label

@onready var curr_visible: int = visible_characters

func vanilla_1151755698__process(delta: float) -> void:
	if visible_characters > curr_visible:
		SFX.play(Sound.TYPE, 0.1, 0, 0, 3)
	curr_visible = visible_characters


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1151755698__process, [delta], 229067184)
	else:
		vanilla_1151755698__process(delta)
