class_name XPBar
extends TextureProgressBar

@onready var xp_amount_text: Label = %XPAmountText

func vanilla_3644966815__ready() -> void:
	max_value = xp_until_level_up()
	value = State.curr_xp
	update_ui()

# TODO
func vanilla_3644966815_xp_until_level_up() -> float:
	match State.level:
		0: return 50
		1: return 300
		2: return 800
		3: return 2000
		4: return 3400
		5: return 5200
		6: return 7000
		7: return 9000
		8: return 11000
		9: return 14000
		10: return 18000
		11: return 22000
		12: return 26000
		13: return 30000
		14: return 34000
		15: return 38000
		16: return 43000
		17: return 48000
		18: return 53000
		19: return 58000
		20: return 63000
		21: return 68000
		22: return 73000
		23: return 78000
		24: return 83000
		_: return 83000 + 5000*(State.level-24)

func vanilla_3644966815_gain_xp(amount: float) -> void:
	value += amount
	while value >= max_value:
		value -= max_value
		State.level += 1
		State.sp += 1
		Globals.drop_collected.emit(ResourceType.SP, 1)
		max_value = xp_until_level_up()
		Refs.curr_scn.play_level_up_fx()
		if State.level >= 25:
			MySteam.set_achievement("SP_25")
	update_ui()
	State.curr_xp = value


func vanilla_3644966815_update_ui() -> void:
	xp_amount_text.text = "%d%%" % int(value*100/max_value)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3644966815__ready, [], 1082707027)
	else:
		vanilla_3644966815__ready()


func xp_until_level_up() -> float:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3644966815_xp_until_level_up, [], 2697813165)
	else:
		return vanilla_3644966815_xp_until_level_up()


func gain_xp(amount: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3644966815_gain_xp, [amount], 2451306501)
	else:
		vanilla_3644966815_gain_xp(amount)


func update_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3644966815_update_ui, [], 568251167)
	else:
		vanilla_3644966815_update_ui()
