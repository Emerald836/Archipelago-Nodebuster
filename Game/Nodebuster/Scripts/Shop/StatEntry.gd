class_name StatEntry
extends HBoxContainer

@onready var stat_name: RichTextLabel = %StatName
@onready var stat_value: RichTextLabel = %StatValue

var stat_desc: String

func vanilla_4251885134__ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func vanilla_4251885134_setup(stat: String, value) -> void:
	stat_name.text = "[right]%s:[/right]" % stat
	stat_value.text = str(value)

func vanilla_4251885134__on_mouse_entered() -> void:
	pivot_offset = size/2
	Refs.tooltip.set_text(stat_desc)
	Refs.tooltip.center_above_or_below(self)
	SFX.play(Sound.BUTTON_HOVER, 0.2)
	Springer.squash(self, 0.4, 0.2)

func vanilla_4251885134__on_mouse_exited() -> void:
	Refs.tooltip.hide()

func vanilla_4251885134_squash_value() -> void:
	var string_size: Vector2 = RTLSizer.get_string_size(stat_value.text)
	stat_value.pivot_offset = string_size/2
	
	var magnitude: float = 9/string_size.x
	Springer.squash(stat_value, -magnitude, magnitude)
	Springer.rotate(stat_value, 16)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4251885134__ready, [], 2743970370)
	else:
		vanilla_4251885134__ready()


func setup(stat: String, value):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4251885134_setup, [stat, value], 3750633535)
	else:
		vanilla_4251885134_setup(stat, value)


func _on_mouse_entered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4251885134__on_mouse_entered, [], 1019780472)
	else:
		vanilla_4251885134__on_mouse_entered()


func _on_mouse_exited():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4251885134__on_mouse_exited, [], 562984340)
	else:
		vanilla_4251885134__on_mouse_exited()


func squash_value():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4251885134_squash_value, [], 2380158815)
	else:
		vanilla_4251885134_squash_value()
