class_name UpgradeIcon
extends NinePatchRect

@onready var texture_rect: TextureRect = %TextureRect

var upgrade: Upgrade


func vanilla_2128695925_load_upgrade(_upgrade: Upgrade) -> void:
	upgrade = _upgrade
	
	texture_rect.texture = upgrade.icon

func vanilla_2128695925_setup_outline_color() -> void:
	if upgrade.is_maxed():
		if Globals.color_palette == 0: self_modulate = MyColors.YELLOW
		else: self_modulate = MyColors.VIOLET
	else:
		if upgrade.can_buy():
			self_modulate = MyColors.GREEN
		else:
			if Globals.color_palette == 0: self_modulate = MyColors.RED
			else: self_modulate = MyColors.DARK_RED

func vanilla_2128695925_set_outline_color(color: Color) -> void:
	self_modulate = color


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func load_upgrade(_upgrade: Upgrade):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2128695925_load_upgrade, [_upgrade], 4193016604)
	else:
		vanilla_2128695925_load_upgrade(_upgrade)


func setup_outline_color():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2128695925_setup_outline_color, [], 3267494339)
	else:
		vanilla_2128695925_setup_outline_color()


func set_outline_color(color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2128695925_set_outline_color, [color], 1625618750)
	else:
		vanilla_2128695925_set_outline_color(color)
