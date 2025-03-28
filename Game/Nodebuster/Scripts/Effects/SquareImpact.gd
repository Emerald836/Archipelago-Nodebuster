class_name SquareImpact
extends Node2D

var size: Vector2
var color: Color

func vanilla_2712748277_setup(_size: Vector2, _color: Color) -> void:
	size = _size
	color = _color
	queue_redraw()
	
	scale = Vector2(1.4, 1.4)
	create_tween().tween_property(self, "scale", Vector2.ONE, 0.12)
	
	if Globals.flashing:
		modulate = MyColors.WHITE
	else:
		modulate = color
	await MyTimer.wait(0.08)
	modulate = color
	await MyTimer.wait(0.05)
	queue_free()

func vanilla_2712748277__draw() -> void:
	draw_rect(Rect2(-size/2, size), Color.WHITE)



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func setup(_size: Vector2, _color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_2712748277_setup, [_size, _color], 3864232774)
	else:
		await vanilla_2712748277_setup(_size, _color)


func _draw():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2712748277__draw, [], 3840475586)
	else:
		vanilla_2712748277__draw()
