class_name PlayerHealthBar
extends TextureProgressBar

signal health_zeroed()

@onready var health_amount_text: Label = %HealthAmountText

var died: bool = false

func vanilla_3089991322_setup_health(max_health: int) -> void:
	max_value = max_health
	value = max_value
	update_ui()

func vanilla_3089991322_gain_max_health(amount: int) -> void:
	max_value += amount

func vanilla_3089991322_update_ui() -> void:
	var display_val: String = "%.1f" % value
	health_amount_text.text = "%s/%d" % [display_val, max_value]

func vanilla_3089991322_adjust_health(amount: float) -> void:
	value += amount
	if value <= 0:
		die()

func vanilla_3089991322_lose_health(amount: float) -> void:
	value -= amount

func vanilla_3089991322__process(delta: float) -> void:
	if died:
		value = 0
	update_ui()
	if value <= 0 and not died:
		die()

func vanilla_3089991322_die() -> void:
	died = true
	health_zeroed.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func setup_health(max_health: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_setup_health, [max_health], 1979646240)
	else:
		vanilla_3089991322_setup_health(max_health)


func gain_max_health(amount: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_gain_max_health, [amount], 3904045075)
	else:
		vanilla_3089991322_gain_max_health(amount)


func update_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_update_ui, [], 3342638202)
	else:
		vanilla_3089991322_update_ui()


func adjust_health(amount: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_adjust_health, [amount], 1273979514)
	else:
		vanilla_3089991322_adjust_health(amount)


func lose_health(amount: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_lose_health, [amount], 263510722)
	else:
		vanilla_3089991322_lose_health(amount)


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322__process, [delta], 924111512)
	else:
		vanilla_3089991322__process(delta)


func die():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3089991322_die, [], 2933780396)
	else:
		vanilla_3089991322_die()
