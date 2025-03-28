extends Node2D

@onready var enemy_drops_layer: int = Layers.bitmask(["EnemyDrops"])

func vanilla_2524049015__ready() -> void:
	$Area2D.area_entered.connect(_bla)

func vanilla_2524049015__physics_process(delta: float) -> void:
	global_position = Globals.mouse_pos
	var results: Array[Dictionary] = ShapeCaster.circle_cast(global_position,
			64, 1, [$Area2D], true, false, 128)
	for result: Dictionary in results:
		print("CCCC")

func vanilla_2524049015__bla(area: Area2D) -> void:
	print("AAAA!")



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2524049015__ready, [], 971027755)
	else:
		vanilla_2524049015__ready()


func _physics_process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2524049015__physics_process, [delta], 3104667191)
	else:
		vanilla_2524049015__physics_process(delta)


func _bla(area: Area2D):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2524049015__bla, [area], 1113069861)
	else:
		vanilla_2524049015__bla(area)
