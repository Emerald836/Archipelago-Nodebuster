extends GPUParticles2D

func vanilla_1163183193__ready() -> void:
	finished.connect(queue_free)
	emitting = true


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1163183193__ready, [], 867757197)
	else:
		vanilla_1163183193__ready()
