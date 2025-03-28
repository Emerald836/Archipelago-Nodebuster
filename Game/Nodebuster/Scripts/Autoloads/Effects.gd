extends Node2D

const _corner_box = preload("res://Scenes/Effects/CornerBox.tscn")

func vanilla_1086510066_square_impact(pos: Vector2, rot_dangle: float, size: Vector2, color: Color) \
-> SquareImpact:
	var effect: SquareImpact = SquareImpact.new()
	Refs.curr_scn.add_child(effect)
	effect.global_position = pos
	effect.rotation_degrees = rot_dangle
	effect.setup(size, color)
	return effect

func vanilla_1086510066_corner_box(pos: Vector2, dangle: float, width: float, color: Color) -> void:
	var effect: CornerBox = _corner_box.instantiate()
	Refs.curr_scn.add_child(effect)
	effect.set_width(width)
	effect.set_color(color)
	effect.global_position = pos - effect.size/2
	effect.rotation_degrees = dangle
	effect.pulse(dangle)
	MyTimer.create(0.15).completed.connect(effect.flicker_out)

func vanilla_1086510066_electricity(from: Vector2, to: Vector2, color: Color, width: float = 4.0,
duration: float = 0.25) \
-> ElectricityEffect:
	var effect: ElectricityEffect = ElectricityEffect.new([color], from, to, 6.0, width)
	Refs.curr_scn.add_child(effect)
	effect.tween_width(0, duration).finished.connect(effect.queue_free)
	return effect

func vanilla_1086510066_floating_text(text: String, pos: Vector2, color: Color) -> FloatingText:
	var effect: FloatingText = FloatingText.new()
	Refs.curr_scn.add_child(effect)
	effect.setup(text, pos, 0.4, color)
	return effect

func vanilla_1086510066_instantiate(scn: PackedScene, pos: Vector2) -> Variant:
	var effect = scn.instantiate()
	Refs.curr_scn.add_child(effect)
	effect.global_position = pos
	return effect


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func square_impact(pos: Vector2, rot_dangle: float, size: Vector2, color: Color) -> SquareImpact:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1086510066_square_impact, [pos, rot_dangle, size, color], 1071023680)
	else:
		return vanilla_1086510066_square_impact(pos, rot_dangle, size, color)


func corner_box(pos: Vector2, dangle: float, width: float, color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1086510066_corner_box, [pos, dangle, width, color], 1695132003)
	else:
		vanilla_1086510066_corner_box(pos, dangle, width, color)


func electricity(from: Vector2, to: Vector2, color: Color, width: float=4.0, 
duration: float=0.25) -> ElectricityEffect:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1086510066_electricity, [from, to, color, width, duration], 1997644115)
	else:
		return vanilla_1086510066_electricity(from, to, color, width, duration)


func floating_text(text: String, pos: Vector2, color: Color) -> FloatingText:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1086510066_floating_text, [text, pos, color], 974805514)
	else:
		return vanilla_1086510066_floating_text(text, pos, color)


func instantiate(scn: PackedScene, pos: Vector2):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1086510066_instantiate, [scn, pos], 3836344950)
	else:
		return vanilla_1086510066_instantiate(scn, pos)
