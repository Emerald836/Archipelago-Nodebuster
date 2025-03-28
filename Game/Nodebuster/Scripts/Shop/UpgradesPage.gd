class_name UpgradesPage
extends Node2D

@onready var upgrade_tree: UpgradeTree = %UpgradeTree


var rmb_down: bool = false

var tree_scale: int = 0

func vanilla_49557336__process(delta: float) -> void:
	var horizontal_dir: int = -int(Input.is_action_pressed("right"))+\
			int(Input.is_action_pressed("left"))
	var vertical_dir: int = -int(Input.is_action_pressed("down"))+\
			int(Input.is_action_pressed("up"))
	var move_dir: Vector2 = Vector2(horizontal_dir, vertical_dir).normalized()
	upgrade_tree.move_tree(move_dir*delta*260)

func vanilla_49557336__input(event: InputEvent) -> void:
	if not is_visible_in_tree(): return
	
	if event.is_action_pressed("rmb"):
		rmb_down = true
		Globals.lock_mouse(self)
		SFX.play(Sound.MOUSE_DOWN)
	elif event.is_action_released("rmb"):
		rmb_down = false
		Globals.unlock_mouse(self)
		SFX.play(Sound.MOUSE_UP)
	elif event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()
	elif event is InputEventMouseMotion and rmb_down:
		upgrade_tree.move_tree(event.relative)

func vanilla_49557336_zoom_out() -> void:
	tree_scale = min(tree_scale+1, 2)
	tween_zoom(false)

func vanilla_49557336_zoom_in() -> void:
	tree_scale = max(tree_scale-1, 0)
	tween_zoom(true)

var zoom_t: Tween
func vanilla_49557336_tween_zoom(zooming_in: bool) -> void:
	var final_scale: Vector2 = Vector2.ONE
	if tree_scale == 0: final_scale = Vector2.ONE
	elif tree_scale == 1: final_scale = Vector2(0.75, 0.75)
	elif tree_scale == 2: final_scale = Vector2(0.5, 0.5)
	
	var scale_diff: float = upgrade_tree.scale.x - final_scale.x
	var relative_pos: Vector2 = upgrade_tree.to_local(Globals.mouse_pos)*scale_diff
	
	if zoom_t: zoom_t.kill()
	zoom_t = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD).set_parallel()
	zoom_t.tween_property(upgrade_tree, "scale", final_scale, 0.2)
	zoom_t.tween_method(upgrade_tree.set_tree_pos, upgrade_tree.position,
		upgrade_tree.position+relative_pos, 0.2)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_49557336__process, [delta], 106912086)
	else:
		vanilla_49557336__process(delta)


func _input(event: InputEvent):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_49557336__input, [event], 3060051879)
	else:
		vanilla_49557336__input(event)


func zoom_out():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_49557336_zoom_out, [], 2637225652)
	else:
		vanilla_49557336_zoom_out()


func zoom_in():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_49557336_zoom_in, [], 2943227251)
	else:
		vanilla_49557336_zoom_in()


func tween_zoom(zooming_in: bool):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_49557336_tween_zoom, [zooming_in], 3087128287)
	else:
		vanilla_49557336_tween_zoom(zooming_in)
