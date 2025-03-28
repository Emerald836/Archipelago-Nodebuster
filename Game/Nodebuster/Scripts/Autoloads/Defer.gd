extends Node

signal new_frame()

func vanilla_1305052536__ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	process_priority = 999

func vanilla_1305052536_idle(obj: Object, method: StringName, args: Array = []) -> void:
	await new_frame
	obj.callv(method, args)

func vanilla_1305052536__process(delta):
	var a = InputEventAction.new()
	a.action = "new_frame"
	a.pressed = true
	Input.parse_input_event(a)

func vanilla_1305052536__input(event):
	if event.is_action_pressed("new_frame"):
		get_viewport().set_input_as_handled()
		new_frame.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1305052536__ready, [], 3175598316)
	else:
		return vanilla_1305052536__ready()


func idle(obj: Object, method: StringName, args: Array=[]):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1305052536_idle, [obj, method, args], 2042285302)
	else:
		await vanilla_1305052536_idle(obj, method, args)


func _process(delta):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1305052536__process, [delta], 3015233398)
	else:
		return vanilla_1305052536__process(delta)


func _input(event):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1305052536__input, [event], 3165265351)
	else:
		return vanilla_1305052536__input(event)
