class_name FrameInstance
extends RefCounted

signal killed()
signal completed()

var ignore_pause: bool

var total_frames: int
var frames_remaining: int

var is_killed: bool

func vanilla_3089282786__init(_frames):
	total_frames = _frames
	frames_remaining = _frames
	is_killed = false

func vanilla_3089282786_update(delta):
	frames_remaining -= 1

func vanilla_3089282786_kill():
	is_killed = true

func vanilla_3089282786_elapsed() -> int:
	return total_frames - frames_remaining



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(_frames):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089282786__init, [_frames], 3194282421)
	else:
		vanilla_3089282786__init(_frames)


func update(delta):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3089282786_update, [delta], 3201016901)
	else:
		return vanilla_3089282786_update(delta)


func kill():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3089282786_kill, [], 3871592814)
	else:
		return vanilla_3089282786_kill()


func elapsed() -> int:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3089282786_elapsed, [], 3206130336)
	else:
		return vanilla_3089282786_elapsed()
