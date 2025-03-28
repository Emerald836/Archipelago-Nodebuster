class_name CornerBox
extends NinePatchRect

@onready var color_rect: ColorRect = %ColorRect

var width: float
var color: Color

func vanilla_61137848_set_width(_width: float) -> void:
	width = _width
	size = Vector2(width, width)
	pivot_offset = size/2

func vanilla_61137848_set_color(_color: Color) -> void:
	color = _color
	modulate = color

var _pulse_t: Tween
func vanilla_61137848_pulse(base_dangle: float = 0) -> void:
	modulate = MyColors.WHITE
	Springer.scale(self, 16/size.x, 1, 500)
	Springer.rotate(self, Utils.flipi()*8, base_dangle)
	await MyTimer.wait(0.1)
	modulate = color

func vanilla_61137848_flicker_out() -> void:
	var t = MyTimer.create_repeating(0.04, 1.0, 6)
	t.repeated.connect(func(): visible = not visible)
	t.completed.connect(queue_free)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func set_width(_width: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_61137848_set_width, [_width], 4092501667)
	else:
		vanilla_61137848_set_width(_width)


func set_color(_color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_61137848_set_color, [_color], 4069007426)
	else:
		vanilla_61137848_set_color(_color)


func pulse(base_dangle: float=0):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_61137848_pulse, [base_dangle], 579645985)
	else:
		await vanilla_61137848_pulse(base_dangle)


func flicker_out():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_61137848_flicker_out, [], 204903503)
	else:
		vanilla_61137848_flicker_out()
