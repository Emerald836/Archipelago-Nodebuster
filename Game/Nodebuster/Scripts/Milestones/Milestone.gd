class_name Milestone
extends RefCounted

var id: StringName
var icon: Texture2D
var name: String
var unlock_desc: String
var reward: String

var claimed: bool = false

func vanilla_1477008377__init(data: Dictionary = {}) -> void:
	if data.is_empty(): return
	
	id = data.id
	icon = load("res://Sprites/MilestoneIcons/%s.png" % id)
	name = data.name
	unlock_desc = data.unlock_desc
	reward = data.reward



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(data: Dictionary={}):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1477008377__init, [data], 1457605932)
	else:
		vanilla_1477008377__init(data)
