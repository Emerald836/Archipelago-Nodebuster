class_name Numbers
extends RefCounted

var enemies_killed: int = 0

var reds_killed: int = 0
var blues_killed: int = 0
var yellows_killed: int = 0


func vanilla_1158530874_save() -> Dictionary:
	var save: Dictionary = inst_to_dict(self)
	save.erase("@path")
	save.erase("@subpath")
	return save

func vanilla_1158530874_load_save(save: Dictionary) -> Numbers:
	var prop_list: Array = get_property_list()
	for property in prop_list:
		if save.has(property.name):
			set(property.name, save[property.name])
	return self


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func save() -> Dictionary:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1158530874_save, [], 418615305)
	else:
		return vanilla_1158530874_save()


func load_save(save: Dictionary) -> Numbers:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1158530874_load_save, [save], 351943208)
	else:
		return vanilla_1158530874_load_save(save)
