extends Label

func vanilla_3343050592__process(delta: float) -> void:
	text = "%d fps" % Engine.get_frames_per_second()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3343050592__process, [delta], 1305057630)
	else:
		vanilla_3343050592__process(delta)
