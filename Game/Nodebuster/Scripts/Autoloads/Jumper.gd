extends Node

# Key: target; Value: current jump tween
var offsets: Dictionary = {}

func vanilla_3116083781_finish(target: Node) -> void:
	if offsets.has(target):
		offsets[target].custom_step(999)

func vanilla_3116083781_kill(target: Node) -> void:
	if offsets.has(target):
		offsets[target].kill()

func vanilla_3116083781_jump(target: Node, direction: Vector2, force: float, duration: float = 0.16)\
-> Tween:
	if offsets.has(target):
		offsets[target].custom_step(999)
	var t: Tween = create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	if target is Node2D:
		var target_2d: Node2D = target as Node2D
		t.tween_property(target_2d, "position",
			target_2d.position + direction.normalized()*force, duration * 0.5)
		t.tween_property(target_2d, "position", target_2d.position, duration * 0.5)
	elif target is Control:
		var target_ct: Control = target as Control
		t.tween_property(target_ct, "position",
			target_ct.position + direction.normalized()*force, duration * 0.5)
		t.tween_property(target_ct, "position", target_ct.position,
			duration * 0.5)
	else:
		assert(false, "Invalid Jumper target: Not a Node2D nor a Control.")
	t.finished.connect(_remove_target.bind(target))
	offsets[target] = t
	return t

func vanilla_3116083781__remove_target(target) -> void:
	offsets.erase(target)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func finish(target: Node):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3116083781_finish, [target], 3143493286)
	else:
		vanilla_3116083781_finish(target)


func kill(target: Node):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3116083781_kill, [target], 681426513)
	else:
		vanilla_3116083781_kill(target)


func jump(target: Node, direction: Vector2, force: float, duration: float=0.16) -> Tween:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3116083781_jump, [target, direction, force, duration], 681403681)
	else:
		return vanilla_3116083781_jump(target, direction, force, duration)


func _remove_target(target):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3116083781__remove_target, [target], 3527075320)
	else:
		vanilla_3116083781__remove_target(target)
