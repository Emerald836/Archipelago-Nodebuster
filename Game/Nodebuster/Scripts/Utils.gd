class_name Utils

static func vanilla_866193288_rand_in_radius(p_radius = 1.0) -> Vector2:
	var r = sqrt(randf_range(0.0, 1.0)) * p_radius
	var t = randf_range(0.0, 1.0) * TAU
	return Vector2(r * cos(t), r * sin(t))

static func vanilla_866193288_rand_on_radius(radius = 1.0) -> Vector2:
	return dir_from_rangle(randf_range(0, TAU)) * radius

static func vanilla_866193288_dir_from_rangle(radians: float) -> Vector2:
	return Vector2(cos(radians), sin(radians))

static func vanilla_866193288_subdivide_angle(from_dangle: float, to_dangle: float, count: int) -> Array[float]:
	assert(from_dangle < to_dangle)
	var angles: Array[float] = []
	var total_dangle: float = abs(to_dangle - from_dangle)
	for i in range(count):
		var angle: float = (total_dangle / count) * i + from_dangle
		angles.append(angle)
	return angles

static func vanilla_866193288_perp_ccw(vec: Vector2) -> Vector2:
	return Vector2(-vec.y, vec.x)

static func vanilla_866193288_get_all_children(node: Node) -> Array[Node]:
	var all_children: Array[Node] = []
	for i: int in node.get_child_count():
		var child: Node = node.get_child(i)
		all_children.append(child)
		if child.get_child_count() > 0:
			all_children.append_array(get_all_children(child))
	return all_children

static func vanilla_866193288_hex(color: Color, with_alpha: bool = true) -> String:
	return "[color=#%s]" % color.to_html(with_alpha)

static func vanilla_866193288_colored(string: String, color: Color, with_alpha: bool = true) -> String:
	return hex(color, with_alpha) + string + "[/color]"

static func vanilla_866193288_log_base(base: float, x: float) -> float:
	return log(x)/log(base)

static func vanilla_866193288_weighted_random(weights: Array) -> int:
	var sum: float = 0.0
	for weight: float in weights:
		sum += weight
	var rand: float = randf() * sum
	for i: int in weights.size():
		if rand < weights[i]:
			return i
		rand -= weights[i]
	push_error("This should never be reached")
	return 0

# Given a dictionary with arbitrary keys, and values = float weights,
# return a key from the dictionary using the key weights.
static func vanilla_866193288_pull_weighted(weighted_dict: Dictionary) -> Variant:
	var weights = weighted_dict.values()
	var keys = weighted_dict.keys()
	var idx = weighted_random(weights)
	return keys[idx]

# 50% chance of either 1 or -1
static func vanilla_866193288_flipi() -> int:
	return (randi() % 2) * 2 - 1

# given a success float [0.0,1.0],
# return true success% of the time and false (1-success)% of the time
static func vanilla_866193288_wflip(success: float) -> bool:
	var rand = randf_range(0.0, 1.0)
	return rand <= success

# Given an array and int n
# return a list of n elements from the array without repeats
static func vanilla_866193288_sample(list: Array, n: int) -> Array:
	var needed: int = n
	var remaining: int = list.size()
	var chosen: Array = []
	
	for i in range(list.size()):
		var prob = float(needed) / remaining
		if wflip(prob):
			chosen.append(list[i])
			needed -= 1
		remaining -= 1
	
	return chosen

# Given a dictionary, return an Array of keys with the largest value
# Keys should be ints or floats
static func vanilla_866193288_get_largest_value(dict: Dictionary) -> Array:
	var curr_max: float = -999999999
	var largest_keys: Array = []
	for key in dict:
		var val = dict[key]
		if val > curr_max:
			curr_max = val
			largest_keys = [key]
		elif val == curr_max:
			largest_keys.append(key)
	return largest_keys

static func vanilla_866193288_comma_sepi(n: int) -> String:
	var result := ""
	var i: int = abs(n)

	while i > 999:
		result = ",%03d%s" % [i % 1000, result]
		i /= 1000

	return "%s%s%s" % ["-" if n < 0 else "", i, result]

static func vanilla_866193288_strip_bbcode(string: String) -> String:
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(string, "", true)


# Game specific
static func vanilla_866193288_num_str(num) -> String:
	if num is float:
		var decimal_places: int = min(5 - floor(log(num)/log(10)), 5)
		var amount_str: String = "%.*f" % [decimal_places, num]
		return amount_str
	else:
		return comma_sepi(num)



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


static func rand_in_radius(p_radius=1.0) -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_rand_in_radius, [p_radius], 1782778826)
	else:
		return vanilla_866193288_rand_in_radius(p_radius)


static func rand_on_radius(radius=1.0) -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_rand_on_radius, [radius], 623751632)
	else:
		return vanilla_866193288_rand_on_radius(radius)


static func dir_from_rangle(radians: float) -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_dir_from_rangle, [radians], 2186883474)
	else:
		return vanilla_866193288_dir_from_rangle(radians)


static func subdivide_angle(from_dangle: float, to_dangle: float, count: int) -> Array[float]:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_subdivide_angle, [from_dangle, to_dangle, count], 300693805)
	else:
		return vanilla_866193288_subdivide_angle(from_dangle, to_dangle, count)


static func perp_ccw(vec: Vector2) -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_perp_ccw, [vec], 1055902875)
	else:
		return vanilla_866193288_perp_ccw(vec)


static func get_all_children(node: Node) -> Array[Node]:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_get_all_children, [node], 493558440)
	else:
		return vanilla_866193288_get_all_children(node)


static func hex(color: Color, with_alpha: bool=true) -> String:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_hex, [color, with_alpha], 2760313453)
	else:
		return vanilla_866193288_hex(color, with_alpha)


static func colored(string: String, color: Color, with_alpha: bool=true) -> String:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_colored, [string, color, with_alpha], 3800467920)
	else:
		return vanilla_866193288_colored(string, color, with_alpha)


static func log_base(base: float, x: float) -> float:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_log_base, [base, x], 1960056772)
	else:
		return vanilla_866193288_log_base(base, x)


static func weighted_random(weights: Array) -> int:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_weighted_random, [weights], 2827657305)
	else:
		return vanilla_866193288_weighted_random(weights)


static func pull_weighted(weighted_dict: Dictionary):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_pull_weighted, [weighted_dict], 118618101)
	else:
		return vanilla_866193288_pull_weighted(weighted_dict)


static func flipi() -> int:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_flipi, [], 3797077596)
	else:
		return vanilla_866193288_flipi()


static func wflip(success: float) -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_wflip, [success], 3817025674)
	else:
		return vanilla_866193288_wflip(success)


static func sample(list: Array, n: int) -> Array:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_sample, [list, n], 1245368010)
	else:
		return vanilla_866193288_sample(list, n)


static func get_largest_value(dict: Dictionary) -> Array:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_get_largest_value, [dict], 2607200021)
	else:
		return vanilla_866193288_get_largest_value(dict)


static func comma_sepi(n: int) -> String:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_comma_sepi, [n], 2459632549)
	else:
		return vanilla_866193288_comma_sepi(n)


static func strip_bbcode(string: String) -> String:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_strip_bbcode, [string], 1101624760)
	else:
		return vanilla_866193288_strip_bbcode(string)


static func num_str(num) -> String:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_866193288_num_str, [num], 1062171280)
	else:
		return vanilla_866193288_num_str(num)
