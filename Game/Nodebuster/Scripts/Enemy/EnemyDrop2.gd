class_name EnemyDrop2
extends Sprite2D

var resource_type: int
var picked: bool = false

var moving_to_cursor: bool = false
var _lerp_start_pos: Vector2
var _lerp_t: float = 0.0

var rid: RID
var shape: RID

func vanilla_1442367945__ready() -> void:
	rid = PhysicsServer2D.area_create()
	
	shape = PhysicsServer2D.circle_shape_create()
	PhysicsServer2D.shape_set_data(shape, 3.0)
	PhysicsServer2D.area_add_shape(rid, shape)
	
	PhysicsServer2D.area_set_monitorable(rid, false)
	
	PhysicsServer2D.area_set_space(rid, get_world_2d().space)
	PhysicsServer2D.area_set_collision_layer(rid, Refs.enemy_drops_mask)
	PhysicsServer2D.area_set_collision_mask(rid, Refs.player_cursor_mask)
	PhysicsServer2D.area_set_area_monitor_callback(rid, _test)
	queue_free()

func vanilla_1442367945_set_pos(pos: Vector2) -> void:
	global_position = pos
	PhysicsServer2D.area_set_transform(rid, Transform2D(0, global_position))

func vanilla_1442367945__test(status: int, area_rid: RID, instance_id: int, area_shape_idx: int, self_shape_idx: int) -> void:
	print("BBBBB")

func vanilla_1442367945_setup_resource_type(_resource_type: int) -> void:
	resource_type = _resource_type
	if resource_type == ResourceType.BITS:
		texture = preload("res://Sprites/Drops/RedDrop.png")
	elif resource_type == ResourceType.NODES:
		texture = preload("res://Sprites/Drops/BlueDrop.png")
	elif resource_type == ResourceType.PROCESSORS:
		texture = preload("res://Sprites/Drops/YellowDrop.png")
	self_modulate = ResourceType.get_color(resource_type)

func vanilla_1442367945_pick_up() -> void:
	if picked: return
	picked = true
	var move_away_dir: Vector2 = Globals.mouse_pos.direction_to(global_position)
	var move_away_dest: Vector2 = global_position + move_away_dir*26
	create_tween().tween_property(self, "global_position", move_away_dest, 0.2) \
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD) \
			.finished.connect(_on_move_away_finished)
	SFX.play(Sound.PICKUP_START)

func vanilla_1442367945__on_move_away_finished() -> void:
	moving_to_cursor = true
	_lerp_start_pos = global_position

func vanilla_1442367945__process(delta: float) -> void:
	if moving_to_cursor:
		_lerp_t += delta * 6
		global_position = lerp(_lerp_start_pos, Globals.mouse_pos, ease(_lerp_t, 1.5))
		if _lerp_t >= 1.0:
			moving_to_cursor = false
			
			State.gain_resource(resource_type, 1)
			Globals.drop_collected.emit(resource_type, 1)
			
			SFX.play(Sound.PICKUP_RESOURCE, 0.1)
			queue_free()



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945__ready, [], 3221702141)
	else:
		vanilla_1442367945__ready()


func set_pos(pos: Vector2):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945_set_pos, [pos], 2805480838)
	else:
		vanilla_1442367945_set_pos(pos)


func _test(status: int, area_rid: RID, instance_id: int, area_shape_idx: int, self_shape_idx: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945__test, [status, area_rid, instance_id, area_shape_idx, self_shape_idx], 2310258728)
	else:
		vanilla_1442367945__test(status, area_rid, instance_id, area_shape_idx, self_shape_idx)


func setup_resource_type(_resource_type: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945_setup_resource_type, [_resource_type], 2553233986)
	else:
		vanilla_1442367945_setup_resource_type(_resource_type)


func pick_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945_pick_up, [], 3362838068)
	else:
		vanilla_1442367945_pick_up()


func _on_move_away_finished():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945__on_move_away_finished, [], 2300860405)
	else:
		vanilla_1442367945__on_move_away_finished()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1442367945__process, [delta], 1682691271)
	else:
		vanilla_1442367945__process(delta)
