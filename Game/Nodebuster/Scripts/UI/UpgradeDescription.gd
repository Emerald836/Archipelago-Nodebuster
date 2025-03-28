class_name UpgradeDescription
extends ScreenControl

@onready var upgrade_name: RichTextLabel = %UpgradeName
@onready var upgrade_icon: UpgradeIcon = %UpgradeIcon
@onready var description: RichTextLabel = %Description
@onready var level: RichTextLabel = %Level
@onready var cost_panel: PanelContainer = %CostPanel
@onready var cost: RichTextLabel = %Cost

var upgrade: Upgrade

func vanilla_1419401520__process(delta: float) -> void:
	if is_visible_in_tree():
		update_cost_text()

var spr
func vanilla_1419401520_show_upgrade_node(upgrade_node: UpgradeNode) -> void:
	scale = Vector2.ONE
	rotation = 0
	show()
	load_upgrade(upgrade_node.upgrade)
	center_above_or_below(upgrade_node)
	attach(upgrade_node)
	
	pivot_offset = size/2
	var springs: Array[Spring] = Springer.squash(self, -0.3, 0.5, 1, 1000, 18)
	for spring: Spring in springs: spring.set_range(0.5, 1.5)
	Springer.rotate(self, 8).set_range(-10, 10)

func vanilla_1419401520_load_upgrade(_upgrade: Upgrade) -> void:
	upgrade = _upgrade
	upgrade_icon.load_upgrade(upgrade)
	refresh_ui()

func vanilla_1419401520_refresh_ui() -> void:
	print("test")
	if not upgrade: return
	upgrade_name.text = upgrade.name
	description.text = "[center]%s[/center]" % upgrade.description
	level.text = "[center]Lv. %d / %d[/center]" % [upgrade.curr_level, upgrade.get_max_level()]
	
	update_cost_text()
	propagate_notification(NOTIFICATION_VISIBILITY_CHANGED)

func vanilla_1419401520_update_cost_text() -> void:
	if not upgrade: return
	
	if upgrade.is_maxed():
		cost.text = "[center]MAX[/center]"
		cost_panel.self_modulate = lerp(MyColors.YELLOW, MyColors.BG, 0.4)
	else:
		cost.text = "[center]%s[/center]" % \
				ResourceType.resource_str(upgrade.resource_type,
				"%s / %s" % [Utils.num_str(State.get_resource(upgrade.resource_type)),
				Utils.num_str(upgrade.get_cost())])
		if upgrade.can_buy():
			cost_panel.self_modulate = lerp(MyColors.GREEN, MyColors.BG, 0.7)
		else:
			cost_panel.self_modulate = lerp(MyColors.RED, MyColors.BG, 0.7)

func vanilla_1419401520_spring_level_up() -> void:
	if level == null: return
	level.pivot_offset = level.size/2
	Springer.squash(level, -0.3, 0.6)
	Springer.rotate(level, 6)
	
	cost.pivot_offset = cost.size/2
	Springer.squash(cost, -0.3, 0.6)
	Springer.rotate(cost, -6)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520__process, [delta], 3575503662)
	else:
		vanilla_1419401520__process(delta)


func show_upgrade_node(upgrade_node: UpgradeNode):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520_show_upgrade_node, [upgrade_node], 723590173)
	else:
		vanilla_1419401520_show_upgrade_node(upgrade_node)


func load_upgrade(_upgrade: Upgrade):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520_load_upgrade, [_upgrade], 1640649303)
	else:
		vanilla_1419401520_load_upgrade(_upgrade)


func refresh_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520_refresh_ui, [], 3102433116)
	else:
		vanilla_1419401520_refresh_ui()


func update_cost_text():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520_update_cost_text, [], 1058209295)
	else:
		vanilla_1419401520_update_cost_text()


func spring_level_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1419401520_spring_level_up, [], 1614061022)
	else:
		vanilla_1419401520_spring_level_up()
