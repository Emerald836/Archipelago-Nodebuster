class_name ResourcePanel
extends PanelContainer

signal hovered()
signal unhovered()

@onready var resource_icon: TextureRect = %ResourceIcon
@onready var amount_text: RichTextLabel = %AmountText

var resource_type: int
var amount

func vanilla_2242095900__ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func vanilla_2242095900_set_resource_type(_resource_type: int) -> void:
	resource_type = _resource_type
	resource_icon.texture = ResourceType.get_icon(resource_type)
	amount_text.add_theme_color_override("default_color",
			ResourceType.get_color(resource_type))
	
	State.get_resource_changed_signal(resource_type).connect(refresh_ui)
	refresh_ui()

func vanilla_2242095900_refresh_ui() -> void:
	amount = State.get_resource(resource_type)
	amount_text.text = "[right]%s[/right]" % Utils.num_str(amount)

func vanilla_2242095900_squash() -> void:
	amount_text.pivot_offset = amount_text.size/2
	var magnitude: float = 9/amount_text.size.x
	Springer.squash(amount_text, -magnitude, magnitude)
	Springer.rotate(amount_text, 16)
	
	amount_text.add_theme_color_override("default_color", MyColors.WHITE)
	await MyTimer.wait(0.1)
	amount_text.add_theme_color_override("default_color",
			ResourceType.get_color(resource_type))

func vanilla_2242095900__on_mouse_entered() -> void:
	hovered.emit()

func vanilla_2242095900__on_mouse_exited() -> void:
	unhovered.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2242095900__ready, [], 1807260048)
	else:
		vanilla_2242095900__ready()


func set_resource_type(_resource_type: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2242095900_set_resource_type, [_resource_type], 4032726640)
	else:
		vanilla_2242095900_set_resource_type(_resource_type)


func refresh_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2242095900_refresh_ui, [], 3489990728)
	else:
		vanilla_2242095900_refresh_ui()


func squash():
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_2242095900_squash, [], 2589357457)
	else:
		await vanilla_2242095900_squash()


func _on_mouse_entered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2242095900__on_mouse_entered, [], 1963368454)
	else:
		vanilla_2242095900__on_mouse_entered()


func _on_mouse_exited():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2242095900__on_mouse_exited, [], 3585039970)
	else:
		vanilla_2242095900__on_mouse_exited()
