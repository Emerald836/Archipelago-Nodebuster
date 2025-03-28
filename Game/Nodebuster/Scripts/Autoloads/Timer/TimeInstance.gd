class_name TimeInstance
extends RefCounted

signal killed()
signal repeated()
signal completed()

var ignore_pause: bool
var realtime: bool

var total_time: float
var time_remaining: float

var decrement_ratio: float = 0
var num_repeats: int = 0
var curr_repeats: int = 0

var is_killed: bool

func vanilla_1909671590__init(_time: float):
	total_time = _time
	time_remaining = _time
	is_killed = false

func vanilla_1909671590_update(delta):
	time_remaining -= delta

func vanilla_1909671590_kill():
	is_killed = true

func vanilla_1909671590_elapsed() -> float:
	return total_time - time_remaining

func vanilla_1909671590_done_repeating() -> bool:
	if num_repeats < 0: return false
	else: return curr_repeats >= num_repeats

func vanilla_1909671590_set_realtime() -> TimeInstance:
	realtime = true
	return self


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(_time: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1909671590__init, [_time], 1626991609)
	else:
		vanilla_1909671590__init(_time)


func update(delta):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1909671590_update, [delta], 3020027657)
	else:
		return vanilla_1909671590_update(delta)


func kill():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1909671590_kill, [], 570336050)
	else:
		return vanilla_1909671590_kill()


func elapsed() -> float:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1909671590_elapsed, [], 1528452580)
	else:
		return vanilla_1909671590_elapsed()


func done_repeating() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1909671590_done_repeating, [], 2052566474)
	else:
		return vanilla_1909671590_done_repeating()


func set_realtime() -> TimeInstance:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1909671590_set_realtime, [], 1654489092)
	else:
		return vanilla_1909671590_set_realtime()
