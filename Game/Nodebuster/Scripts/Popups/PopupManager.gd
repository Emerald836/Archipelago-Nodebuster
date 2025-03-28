class_name PopupManager
extends Control


@onready var darken_screen: ColorRect = %DarkenScreen


var stack: Array[Control] = []

func vanilla_3782292924_has_popup() -> bool:
	return not stack.is_empty()

func vanilla_3782292924_add_popup(popup: Control) -> void:
	hide_curr()
	stack.append(popup)
	add_child(popup)
	darken_screen.show()
	popup.global_position = Vector2(3000, 2000)
	if popup.has_signal("back"):
		popup.back.connect(pop_curr)

func vanilla_3782292924_focus_curr() -> void:
	if stack.size() > 0:
		var popup: Control = stack.back()
		popup.set_offsets_preset(PRESET_CENTER, PRESET_MODE_KEEP_SIZE)
		popup.position = round(popup.position)
		var end_pos_y = popup.position.y
		popup.position.y += 270
		popup.show()
		
		Globals.lock_mouse(self)
		var t = create_tween().tween_property(popup, "position:y", end_pos_y, 0.15) \
		.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
		if popup.has_method("on_focus"):
			popup.on_focus()
		t.finished.connect(Globals.unlock_mouse.bind(self))
		await t.finished

func vanilla_3782292924_hide_curr() -> void:
	if stack.size() > 0:
		stack.back().hide()

func vanilla_3782292924_pop_curr(free: bool = true) -> void:
	if stack.size() > 0:
		var popup: Control = stack.pop_back()
		
		if free: popup.queue_free()
		else: remove_child(popup)
		
		if stack.size() > 0:
			focus_curr()
		else:
			darken_screen.hide()

func vanilla_3782292924_remove_popup(popup: Control, free: bool = true) -> void:
	var refocus: bool = stack.back() == popup
	stack.erase(popup)
	if free: popup.queue_free()
	if refocus: focus_curr()

func vanilla_3782292924_clear_popups() -> void:
	for i in range(stack.size()):
		stack[i].queue_free()
	stack.clear()
	
	darken_screen.hide()



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func has_popup() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3782292924_has_popup, [], 2316032971)
	else:
		return vanilla_3782292924_has_popup()


func add_popup(popup: Control):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3782292924_add_popup, [popup], 2629874712)
	else:
		vanilla_3782292924_add_popup(popup)


func focus_curr():
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_3782292924_focus_curr, [], 24845591)
	else:
		await vanilla_3782292924_focus_curr()


func hide_curr():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3782292924_hide_curr, [], 1983235857)
	else:
		vanilla_3782292924_hide_curr()


func pop_curr(free: bool=true):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3782292924_pop_curr, [free], 3669480582)
	else:
		vanilla_3782292924_pop_curr(free)


func remove_popup(popup: Control, free: bool=true):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3782292924_remove_popup, [popup, free], 1492205597)
	else:
		vanilla_3782292924_remove_popup(popup, free)


func clear_popups():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3782292924_clear_popups, [], 1237745737)
	else:
		vanilla_3782292924_clear_popups()
