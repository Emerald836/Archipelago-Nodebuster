extends Node

const temp_path: String = "user://save_temp.dat"
const path: String = "user://save.dat"


func vanilla_386831795_has_save() -> bool:
	return FileAccess.file_exists(path)

func vanilla_386831795_create_new_save() -> void:
	UpgradeStore.reset()
	MilestoneStore.reset()
	State.reset()

func vanilla_386831795_save_game() -> void:
	var save: Dictionary = {
		"upgrades": UpgradeStore.save(),
		"milestones": MilestoneStore.save(),
		"state": State.save(),
	}
	
	var save_str: String = var_to_str(save)
	var file = FileAccess.open(temp_path, FileAccess.WRITE)
	if file:
		file.store_string(save_str)
		file.close()
		
		DirAccess.copy_absolute(temp_path, path)
		DirAccess.remove_absolute(temp_path)

func vanilla_386831795_load_game() -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var save_str: String = file.get_as_text()
		var save: Dictionary = str_to_var(save_str)
		
		State.load_save(save.state)
		UpgradeStore.load_save(save.upgrades)
		# TODO: Properly applying Milestones as necessary (e.g. for stat buff rewards)
		MilestoneStore.load_save(save.milestones)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func has_save() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_386831795_has_save, [], 1587490109)
	else:
		return vanilla_386831795_has_save()


func create_new_save():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_386831795_create_new_save, [], 1700669566)
	else:
		vanilla_386831795_create_new_save()


func save_game():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_386831795_save_game, [], 660890171)
	else:
		vanilla_386831795_save_game()


func load_game():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_386831795_load_game, [], 2428160780)
	else:
		vanilla_386831795_load_game()
