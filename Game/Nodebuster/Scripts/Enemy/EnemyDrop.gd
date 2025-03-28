class_name EnemyDrop
extends Area2D

@onready var sprite: Sprite2D = %Sprite2D

var resource_type: int
var picked: bool = false

var moving_to_cursor: bool = false
var _lerp_start_pos: Vector2
var _lerp_t: float = 0.0

func vanilla_564307735__ready() -> void:
	var rid: RID = PhysicsServer2D.area_create()
	PhysicsServer2D.area_set_space(rid, Refs.physics_state)
	var shape = CircleShape2D.new()
	shape.radius = 3
	PhysicsServer2D.area_set_transform(rid, Transform2D(0, global_position))
	PhysicsServer2D.area_add_shape(rid, shape.get_rid(), )
	PhysicsServer2D.area_set_collision_layer(rid, Layers.bitmask(["EnemyDrops"]))
	PhysicsServer2D.area_set_collision_mask(rid, 0)

func vanilla_564307735_setup_resource_type(_resource_type: int) -> void:
	resource_type = _resource_type
	if resource_type == ResourceType.BITS:
		sprite.texture = preload("res://Sprites/Drops/RedDrop.png")
	elif resource_type == ResourceType.NODES:
		sprite.texture = preload("res://Sprites/Drops/BlueDrop.png")
	elif resource_type == ResourceType.PROCESSORS:
		sprite.texture = preload("res://Sprites/Drops/YellowDrop.png")
	sprite.self_modulate = ResourceType.get_color(resource_type)

func vanilla_564307735_pick_up() -> void:
	if picked: return
	picked = true
	var move_away_dir: Vector2 = Globals.mouse_pos.direction_to(global_position)
	var move_away_dest: Vector2 = global_position + move_away_dir*26
	create_tween().tween_property(self, "global_position", move_away_dest, 0.2) \
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD) \
			.finished.connect(_on_move_away_finished)
	SFX.play(Sound.PICKUP_START)

func vanilla_564307735__on_move_away_finished() -> void:
	moving_to_cursor = true
	_lerp_start_pos = global_position

func vanilla_564307735__process(delta: float) -> void:
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
		_ModLoaderHooks.call_hooks(vanilla_564307735__ready, [], 1629578699)
	else:
		vanilla_564307735__ready()


func setup_resource_type(_resource_type: int):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_564307735_setup_resource_type, [_resource_type], 674373840)
	else:
		vanilla_564307735_setup_resource_type(_resource_type)


func pick_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_564307735_pick_up, [], 2362372034)
	else:
		vanilla_564307735_pick_up()


func _on_move_away_finished():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_564307735__on_move_away_finished, [], 2884654019)
	else:
		vanilla_564307735__on_move_away_finished()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_564307735__process, [delta], 3027050517)
	else:
		vanilla_564307735__process(delta)
