extends Node

# Contains data that should be saved to disk

signal bits_changed()
signal nodes_changed()
signal cores_changed()
signal sp_changed()
signal netcoin_changed()
signal processors_changed()

var bits: int :
	set(val):
		if val > bits:
			total_bits += val-bits
		bits = maxi(val, 0)
		bits_changed.emit()

var nodes: int :
	set(val):
		if val > nodes:
			total_nodes += val-nodes
		nodes = maxi(val, 0)
		nodes_changed.emit()
		if nodes > 0: nodes_unlocked = true
var nodes_unlocked: bool = false

var cores: int :
	set(val):
		cores = maxi(val, 0)
		cores_changed.emit()
		if cores > 0: cores_unlocked = true
var cores_unlocked: bool = false

var sp: int :
	set(val):
		sp = maxi(val, 0)
		sp_changed.emit()
		if sp > 0: sp_unlocked = true
var sp_unlocked: bool = false

var netcoin: float :
	set(val):
		netcoin = max(val, 0)
		netcoin_changed.emit()
		if netcoin > 0: netcoin_unlocked = true
var netcoin_unlocked: bool = false

var processors: int :
	set(val):
		processors = maxi(val, 0)
		processors_changed.emit()
		if processors > 0: processors_unlocked = true
var processors_unlocked: bool = false

var level: int
var curr_xp: float

var bonus_max_health: int

var stats: Stats
var nums: Numbers
var crypto_mine: CryptoMine
var lab_research_progress: float
var virus_deployed: bool

var curr_prestige: int
var max_prestige: int

var sessions: int
var total_bits: int
var total_nodes: int


func vanilla_2645365107__init() -> void:
	reset()

func vanilla_2645365107_reset() -> void:
	bits = 0
	nodes = 0
	nodes_unlocked = false
	cores = 0
	cores_unlocked = false
	sp = 0
	sp_unlocked = false
	netcoin = 0
	netcoin_unlocked = false
	processors = 0
	processors_unlocked = false
	level = 0
	curr_xp = 0
	bonus_max_health = 0
	stats = Stats.new()
	nums = Numbers.new()
	crypto_mine = CryptoMine.new()
	lab_research_progress = 0.0
	virus_deployed = false
	curr_prestige = 0
	max_prestige = 0
	sessions = 0
	total_bits = 0
	total_nodes = 0

func vanilla_2645365107__process(delta: float) -> void:
	if crypto_mine:
		crypto_mine.process(delta)

func vanilla_2645365107_get_resource(resource_type: int):
	match resource_type:
		ResourceType.BITS: return bits
		ResourceType.NODES: return nodes
		ResourceType.CORES: return cores
		ResourceType.SP: return sp
		ResourceType.NETCOIN: return netcoin
		ResourceType.PROCESSORS: return processors
		_: return 0

func vanilla_2645365107_has_resource(resource_type: int, amount) -> bool:
	var curr_amount = get_resource(resource_type)
	return curr_amount >= amount

func vanilla_2645365107_lose_resource(resource_type: int, amount) -> void:
	match resource_type:
		ResourceType.BITS: bits -= amount
		ResourceType.NODES: nodes -= amount
		ResourceType.CORES: cores -= amount
		ResourceType.SP: sp -= amount
		ResourceType.NETCOIN: netcoin -= amount
		ResourceType.PROCESSORS: processors -= amount

func vanilla_2645365107_gain_resource(resource_type: int, amount) -> void:
	match resource_type:
		ResourceType.BITS: bits += amount
		ResourceType.NODES: nodes += amount
		ResourceType.CORES: cores += amount
		ResourceType.SP: sp += amount
		ResourceType.NETCOIN: netcoin += amount
		ResourceType.PROCESSORS: processors += amount

func vanilla_2645365107_get_resource_changed_signal(resource_type: int) -> Signal:
	match resource_type:
		ResourceType.BITS: return bits_changed
		ResourceType.NODES: return nodes_changed
		ResourceType.CORES: return cores_changed
		ResourceType.SP: return sp_changed
		ResourceType.NETCOIN: return netcoin_changed
		ResourceType.PROCESSORS: return processors_changed
		_: return Signal()


func vanilla_2645365107_save() -> Dictionary:
	var save: Dictionary = inst_to_dict(self)
	save.erase("@path")
	save.erase("@subpath")
	save["version"] = 0
	save["nums"] = nums.save()
	save["crypto_mine"] = crypto_mine.save()
	save.erase("stats")
	
	return save

func vanilla_2645365107_load_save(save: Dictionary) -> void:
	reset()
	var prop_list: Array = get_property_list()
	for property in prop_list:
		if save.has(property.name):
			set(property.name, save[property.name])
	nums = Numbers.new().load_save(save.nums)
	crypto_mine = CryptoMine.new().load_save(save.crypto_mine)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _init():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107__init, [], 3971186406)
	else:
		vanilla_2645365107__init()


func reset():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107_reset, [], 3993580470)
	else:
		vanilla_2645365107_reset()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107__process, [delta], 4261029489)
	else:
		vanilla_2645365107__process(delta)


func get_resource(resource_type: int):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2645365107_get_resource, [resource_type], 2270977018)
	else:
		return vanilla_2645365107_get_resource(resource_type)


func has_resource(resource_type: int, amount) -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2645365107_has_resource, [resource_type, amount], 2664583990)
	else:
		return vanilla_2645365107_has_resource(resource_type, amount)


func lose_resource(resource_type: int, amount):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107_lose_resource, [resource_type, amount], 2843570285)
	else:
		vanilla_2645365107_lose_resource(resource_type, amount)


func gain_resource(resource_type: int, amount):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107_gain_resource, [resource_type, amount], 1578314553)
	else:
		vanilla_2645365107_gain_resource(resource_type, amount)


func get_resource_changed_signal(resource_type: int) -> Signal:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2645365107_get_resource_changed_signal, [resource_type], 839807744)
	else:
		return vanilla_2645365107_get_resource_changed_signal(resource_type)


func save() -> Dictionary:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2645365107_save, [], 3895414466)
	else:
		return vanilla_2645365107_save()


func load_save(save: Dictionary):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2645365107_load_save, [save], 2227639425)
	else:
		vanilla_2645365107_load_save(save)
