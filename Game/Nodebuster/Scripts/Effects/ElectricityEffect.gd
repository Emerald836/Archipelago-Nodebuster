class_name ElectricityEffect
extends Node2D

var lines: Array = []
var to: Vector2

var line_width: float = 2.0
var width: float = 6.0

# colors: should be an array of Colors. One Line2D will be created for each element
# from and to should be global positions
func vanilla_629732148__init(colors: Array, _from: Vector2, _to: Vector2,
_width: float = 6.0, _line_width: float = 2.0) -> void:
	position = _from
	to = _to
	width = _width
	line_width = _line_width
	
	for color in colors:
		var line = Line2D.new()
		line.default_color = color
		add_child(line)
		lines.append(line)
	
	set_line_width(line_width)

func vanilla_629732148__ready():
	update_all()

func vanilla_629732148_update_all():
	for line in lines:
		update_effect(line)

func vanilla_629732148_update_effect(line: Line2D) -> void:
	var from = Vector2.ZERO
	var local_to = to_local(to)
	
	var dir = (local_to - from).normalized()
	var perp = Utils.perp_ccw(dir)
	
	var dist = from.distance_to(local_to)
	var num_vertices = 1 + int(ceil(dist / 15.0))
	
	var points = []
	points.resize(2 + num_vertices)
	
	points[0] = from
	
	var distances = []
	distances.resize(num_vertices)
	
	for i in range(distances.size()):
		var prev_dist = (dist / num_vertices) * i
		var this_dist = prev_dist + (dist / num_vertices) * randf_range(0.7, 1.3)
		distances[i] = this_dist
		
		var point = from + this_dist * dir
		point += perp * randf_range(-(width + 6), (width + 6))
		
		points[i + 1] = point
	
	points[-1] = local_to
	
	line.points = points

func vanilla_629732148_set_line_width(lw: float) -> void:
	line_width = lw
	for line in lines:
		line.width = lw

func vanilla_629732148_tween_width(end_width: float, duration: float) -> MethodTweener:
	var tween = create_tween()
	return tween.tween_method(set_line_width, line_width, end_width, duration)\
		.set_trans(Tween.TRANS_LINEAR)



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(colors: Array, _from: Vector2, _to: Vector2, 
_width: float=6.0, _line_width: float=2.0):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_629732148__init, [colors, _from, _to, _width, _line_width], 811049287)
	else:
		vanilla_629732148__init(colors, _from, _to, _width, _line_width)


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_629732148__ready, [], 1005163432)
	else:
		return vanilla_629732148__ready()


func update_all():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_629732148_update_all, [], 539446415)
	else:
		return vanilla_629732148_update_all()


func update_effect(line: Line2D):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_629732148_update_effect, [line], 3047732803)
	else:
		vanilla_629732148_update_effect(line)


func set_line_width(lw: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_629732148_set_line_width, [lw], 167804134)
	else:
		vanilla_629732148_set_line_width(lw)


func tween_width(end_width: float, duration: float) -> MethodTweener:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_629732148_tween_width, [end_width, duration], 123474902)
	else:
		return vanilla_629732148_tween_width(end_width, duration)
