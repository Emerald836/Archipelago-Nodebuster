class_name Upgrade
extends RefCounted

var id: StringName
var icon: Texture2D
var name: String
var description: String
var resource_type: int
var costs: Array

var curr_level: int


func vanilla_158563881__init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	
	id = data.id
	icon = load("res://Sprites/UpgradeIcons/%s.png" % id)
	name = data.name
	description = data.description
	resource_type = data.resource_type
	costs.assign(data.costs)

func vanilla_158563881_get_max_level() -> int:
	return costs.size()

func vanilla_158563881_is_maxed() -> bool:
	return curr_level >= costs.size()

# Returns -1 if curr_level isn't in costs
func vanilla_158563881_get_cost():
	if curr_level < 0 or curr_level >= costs.size(): return -1
	return costs[curr_level]

func vanilla_158563881_can_buy() -> bool:
	return State.has_resource(resource_type, get_cost()) and not is_maxed()



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(data: Dictionary={}):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_158563881__init, [data], 971525468)
	else:
		vanilla_158563881__init(data)


func get_max_level() -> int:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_158563881_get_max_level, [], 3956813989)
	else:
		return vanilla_158563881_get_max_level()


func is_maxed() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_158563881_is_maxed, [], 351203699)
	else:
		return vanilla_158563881_is_maxed()


func get_cost():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_158563881_get_cost, [], 918284193)
	else:
		return vanilla_158563881_get_cost()


func can_buy() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_158563881_can_buy, [], 1986726282)
	else:
		return vanilla_158563881_can_buy()
