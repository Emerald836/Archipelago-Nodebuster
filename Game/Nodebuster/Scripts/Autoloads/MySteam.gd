extends Node

func vanilla_57260050__ready() -> void:
	var response: Dictionary = Steam.steamInitEx(true, 3107330)
	print("Did Steam initialize?: %s" % response)
	var is_owned: bool = Steam.isSubscribed()
	var family_shared: bool = Steam.isSubscribedFromFamilySharing()
	if not is_owned and not family_shared:
		print("User does not own this game")
		get_tree().quit()

func vanilla_57260050__process(delta: float) -> void:
	Steam.run_callbacks()

func vanilla_57260050_set_achievement(achievement_id: String, store_stats: bool = true) -> void:
	Steam.setAchievement(achievement_id)
	if store_stats: Steam.storeStats()



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_57260050__ready, [], 1498285830)
	else:
		vanilla_57260050__ready()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_57260050__process, [delta], 1783036944)
	else:
		vanilla_57260050__process(delta)


func set_achievement(achievement_id: String, store_stats: bool=true):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_57260050_set_achievement, [achievement_id, store_stats], 3777840742)
	else:
		vanilla_57260050_set_achievement(achievement_id, store_stats)
