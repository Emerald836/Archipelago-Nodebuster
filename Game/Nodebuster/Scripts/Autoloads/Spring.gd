class_name Spring
extends RefCounted

signal updated(value: float)
signal killed()

var x: float
var stiffness: float
var dampening: float
var target_x: float
var v: float

var autokill: bool = true
var is_killed: bool = false
var realtime: bool = false

var min_val: float = -999999.0
var max_val: float = 999999.0

var target: Object
var property: NodePath

func vanilla_2784912037__init(_x: float, _stiffness: float, _dampening: float) -> void:
	x = _x
	stiffness = _stiffness
	dampening = _dampening
	target_x = x
	v = 0

func vanilla_2784912037_update(delta: float) -> void:
	if realtime: delta /= Engine.time_scale
	# Workaround for high delta values causing spring to oscillate like crazy
	delta = min(0.05, delta)
	var a: float = -stiffness * (x - target_x) - dampening * v
	v += a * delta
	x = clamp(x + v * delta, min_val, max_val)
	updated.emit(x)
	
	# This value can be tuned depending on the game/resolution, etc.
	if autokill and abs(a) <= 0.0001:
		kill()

func vanilla_2784912037_pull(force: float) -> void:
	x += force

func vanilla_2784912037_set_range(minimum: float, maximum: float) -> void:
	min_val = minimum
	max_val = maximum

func vanilla_2784912037_kill() -> void:
	is_killed = true
	killed.emit()

func vanilla_2784912037_attach(_target: Object, _property: NodePath) -> void:
	target = _target
	property = _property

func vanilla_2784912037_set_autokill(_autokill: bool) -> void:
	autokill = _autokill

func vanilla_2784912037_set_realtime() -> Spring:
	realtime = true
	return self


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init(_x: float, _stiffness: float, _dampening: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037__init, [_x, _stiffness, _dampening], 908156760)
	else:
		vanilla_2784912037__init(_x, _stiffness, _dampening)


func update(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_update, [delta], 773314120)
	else:
		vanilla_2784912037_update(delta)


func pull(force: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_pull, [force], 1850251170)
	else:
		vanilla_2784912037_pull(force)


func set_range(minimum: float, maximum: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_set_range, [minimum, maximum], 994018173)
	else:
		vanilla_2784912037_set_range(minimum, maximum)


func kill():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_kill, [], 1850058417)
	else:
		vanilla_2784912037_kill()


func attach(_target: Object, _property: NodePath):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_attach, [_target, _property], 4290891674)
	else:
		vanilla_2784912037_attach(_target, _property)


func set_autokill(_autokill: bool):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2784912037_set_autokill, [_autokill], 2428213653)
	else:
		vanilla_2784912037_set_autokill(_autokill)


func set_realtime() -> Spring:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2784912037_set_realtime, [], 1156813443)
	else:
		return vanilla_2784912037_set_realtime()
