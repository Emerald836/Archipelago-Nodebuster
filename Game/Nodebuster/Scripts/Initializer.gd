class_name Initializer
extends Node

func vanilla_219078459__ready() -> void:
	if get_parent() is ShopScene:
		Refs.upgrade_description = %UpgradeDescription
		Refs.upgrade_tree = %UpgradeTree
	elif get_parent() is BattleScene:
		Refs.health = %HealthBar
		Refs.xp = %XPBar
		Refs.enemy_spawner = %EnemySpawner
		Refs.drop_creator = %EnemyDropsCreator


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_219078459__ready, [], 3188205807)
	else:
		vanilla_219078459__ready()
