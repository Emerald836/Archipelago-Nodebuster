class_name CryptoMine
extends RefCounted

const NETCOINS_PER_BIT: float = 0.00001

var mine_level: int = 0
var curr_bits: float = 0

var curr_speed: int = 0
var processing: bool = true #TODO: Set this to false in main menu or w/e

func vanilla_1537844552__init() -> void:
	calculate_speed()

func vanilla_1537844552_process(delta: float) -> void:
	if not processing: return
	
	var bits_to_process: float = curr_speed * delta
	bits_to_process = min(bits_to_process, curr_bits)
	var netcoin_gain: float = NETCOINS_PER_BIT * bits_to_process
	curr_bits -= bits_to_process
	State.netcoin += netcoin_gain

func vanilla_1537844552_deposit(bits: int) -> void:
	curr_bits += bits

func vanilla_1537844552_get_netcoin_returns() -> float:
	return curr_bits * NETCOINS_PER_BIT

func vanilla_1537844552_level_up() -> void:
	mine_level += 1
	calculate_speed()

# Return the seconds to completion
func vanilla_1537844552_get_time_remaining() -> float:
	return curr_bits / curr_speed

func vanilla_1537844552_calculate_speed() -> void:
	match mine_level:
		0: curr_speed = 5
		1: curr_speed = 10
		2: curr_speed = 20
		3: curr_speed = 40
		4: curr_speed = 80
		5: curr_speed = 160
		6: curr_speed = 320
		7: curr_speed = 640
		8: curr_speed = 1280
		9: curr_speed = 1800
		10: curr_speed = 2600
		11: curr_speed = 3400
		12: curr_speed = 4200
		13: curr_speed = 5200
		14: curr_speed = 6400
		15: curr_speed = 7600
		16: curr_speed = 8800
		17: curr_speed = 10000
		18: curr_speed = 12000
		19: curr_speed = 14000
		20: curr_speed = 17000
		21: curr_speed = 21000
		22: curr_speed = 25000
		23: curr_speed = 32000
		24: curr_speed = 42000
		25: curr_speed = 52000
		26: curr_speed = 64000
		27: curr_speed = 80000
		28: curr_speed = 100000
		29: curr_speed = 124000
		30: curr_speed = 164000
		31: curr_speed = 228000
		32: curr_speed = 320000
		33: curr_speed = 480000
		34: curr_speed = 640000
		35: curr_speed = 820000
		36: curr_speed = 1280000
		_: curr_speed  = 1280000

func vanilla_1537844552_is_maxed() -> bool:
	return mine_level >= 36

func vanilla_1537844552_save() -> Dictionary:
	return {
		"mine_level": mine_level,
		"curr_bits": curr_bits,
	}

func vanilla_1537844552_load_save(save: Dictionary) -> CryptoMine:
	mine_level = save.mine_level
	curr_bits = save.curr_bits
	calculate_speed()
	return self


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1537844552__init, [], 2673786843)
	else:
		vanilla_1537844552__init()


func process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1537844552_process, [delta], 599340743)
	else:
		vanilla_1537844552_process(delta)


func deposit(bits: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1537844552_deposit, [bits], 1774466272)
	else:
		vanilla_1537844552_deposit(bits)


func get_netcoin_returns() -> float:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1537844552_get_netcoin_returns, [], 3441551945)
	else:
		return vanilla_1537844552_get_netcoin_returns()


func level_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1537844552_level_up, [], 295663108)
	else:
		vanilla_1537844552_level_up()


func get_time_remaining() -> float:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1537844552_get_time_remaining, [], 432231119)
	else:
		return vanilla_1537844552_get_time_remaining()


func calculate_speed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1537844552_calculate_speed, [], 3432226342)
	else:
		vanilla_1537844552_calculate_speed()


func is_maxed() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1537844552_is_maxed, [], 1299040146)
	else:
		return vanilla_1537844552_is_maxed()


func save() -> Dictionary:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1537844552_save, [], 3075196183)
	else:
		return vanilla_1537844552_save()


func load_save(save: Dictionary) -> CryptoMine:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1537844552_load_save, [save], 744736758)
	else:
		return vanilla_1537844552_load_save(save)
