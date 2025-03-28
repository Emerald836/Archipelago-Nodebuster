class_name ScreenControl
extends Control

var attached_to: Control = null
var attach_offset: Vector2

const SCREEN_SIZE: Vector2i = Vector2i(480, 270)

func vanilla_1300759525__ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func vanilla_1300759525_force_size_update() -> void:
	global_position = Vector2.ZERO
	size = Vector2.ZERO

func vanilla_1300759525_set_pos(pos: Vector2) -> void:
	force_size_update()
	pos.x = clamp(pos.x, 0, SCREEN_SIZE.x-size.x)
	pos.y = clamp(pos.y, 0, SCREEN_SIZE.y-size.y)
	global_position = round(pos)

func vanilla_1300759525_center_above_pos(pos: Vector2, offset: Vector2 = Vector2.ZERO) -> void:
	force_size_update()
	pos.x -= floor(size.x / 2)
	pos.y -= size.y
	pos += offset
	set_pos(pos)

func vanilla_1300759525_center_above(control: Control, offset: Vector2 = Vector2.ZERO) -> void:
	force_size_update()
	var new_pos: Vector2 = control.get_global_transform_with_canvas().origin
	new_pos.x += floor((control.size.x / 2) - size.x / 2)
	new_pos.y -= size.y
	new_pos += offset
	set_pos(new_pos)

func vanilla_1300759525_center_below(control: Control, offset: Vector2 = Vector2.ZERO) -> void:
	force_size_update()
	var new_pos: Vector2 = control.get_global_transform_with_canvas().origin
	new_pos.x += floor((control.size.x / 2) - size.x / 2)
	new_pos.y += control.size.y
	new_pos += offset
	set_pos(new_pos)

# If there is enough space below, center below. Otherwise, center above
func vanilla_1300759525_center_below_or_above(control: Control, offset: Vector2 = Vector2.ZERO) -> void:
	force_size_update()
	# Enough space below so center below
	if control.global_position.y + control.size.y + offset.y + size.y <= SCREEN_SIZE.y:
		center_below(control, offset)
	# Not enough space so center above
	else:
		center_above(control, offset)

func vanilla_1300759525_center_above_or_below(control: Control, offset: Vector2 = Vector2.ZERO) -> void:
	force_size_update()
	# Enough space above so center above
	if control.global_position.y - offset.y - size.y >= 0:
		center_above(control, offset)
	# Not enough space so center below
	else:
		center_below(control, offset)

func vanilla_1300759525_attach(control: Control) -> void:
	attach_offset = get_global_transform_with_canvas().origin - \
			control.get_global_transform_with_canvas().origin
	
	attached_to = control

func vanilla_1300759525_detach() -> void:
	attached_to = null

func vanilla_1300759525__process(delta: float) -> void:
	if attached_to != null and is_instance_valid(attached_to):
		if not attached_to.is_inside_tree():
			detach()
		else:
			set_pos(attached_to.get_global_transform_with_canvas().origin + attach_offset)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525__ready, [], 66626841)
	else:
		vanilla_1300759525__ready()


func force_size_update():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_force_size_update, [], 657921296)
	else:
		vanilla_1300759525_force_size_update()


func set_pos(pos: Vector2):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_set_pos, [pos], 1767211042)
	else:
		vanilla_1300759525_set_pos(pos)


func center_above_pos(pos: Vector2, offset: Vector2=Vector2.ZERO):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_center_above_pos, [pos, offset], 455584675)
	else:
		vanilla_1300759525_center_above_pos(pos, offset)


func center_above(control: Control, offset: Vector2=Vector2.ZERO):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_center_above, [control, offset], 1767587698)
	else:
		vanilla_1300759525_center_above(control, offset)


func center_below(control: Control, offset: Vector2=Vector2.ZERO):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_center_below, [control, offset], 1768877950)
	else:
		vanilla_1300759525_center_below(control, offset)


func center_below_or_above(control: Control, offset: Vector2=Vector2.ZERO):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_center_below_or_above, [control, offset], 2528414122)
	else:
		vanilla_1300759525_center_below_or_above(control, offset)


func center_above_or_below(control: Control, offset: Vector2=Vector2.ZERO):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_center_above_or_below, [control, offset], 1561312298)
	else:
		vanilla_1300759525_center_above_or_below(control, offset)


func attach(control: Control):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_attach, [control], 147808474)
	else:
		vanilla_1300759525_attach(control)


func detach():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525_detach, [], 247425838)
	else:
		vanilla_1300759525_detach()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1300759525__process, [delta], 1779526371)
	else:
		vanilla_1300759525__process(delta)
