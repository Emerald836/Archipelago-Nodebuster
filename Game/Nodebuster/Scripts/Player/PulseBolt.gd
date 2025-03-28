class_name PulseBolt
extends Area2D

@onready var shape: CollisionShape2D = %CollisionShape2D
@onready var sprite: Sprite2D = %Sprite2D

var damage: float
var dir: Vector2
var speed: float = 300
var lifetime: float = randf_range(0.4, 0.6)

var time_alive: float = 0

func vanilla_672325933__ready() -> void:
	area_entered.connect(_on_area_entered)

func vanilla_672325933_setup(dangle: float, _damage: float) -> void:
	rotation_degrees = dangle
	damage = _damage
	dir = Utils.dir_from_rangle(deg_to_rad(dangle))

func vanilla_672325933__physics_process(delta: float) -> void:
	global_position += dir * speed * delta
	time_alive += delta
	
	if time_alive >= lifetime:
		if State.stats.pulse_bolt_explode:
			Globals.create_explosion(global_position, randf_range(0, 90), 64,
					State.stats.pulse_bolt_damage_mod, false)
			SFX.play(Sound.PULSE)
		Effects.square_impact(global_position, 0, Vector2(16, 16), MyColors.BLUE)
		queue_free()

func vanilla_672325933__on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.take_damage(damage)
		Effects.square_impact(global_position, 0, Vector2(16, 16), MyColors.BLUE)
		SFX.play(Sound.HIT, 0.2)
		Refs.curr_scn.enemy_hit(area)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_672325933__ready, [], 3403044961)
	else:
		vanilla_672325933__ready()


func setup(dangle: float, _damage: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_672325933_setup, [dangle, _damage], 1297745534)
	else:
		vanilla_672325933_setup(dangle, _damage)


func _physics_process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_672325933__physics_process, [delta], 3912832237)
	else:
		vanilla_672325933__physics_process(delta)


func _on_area_entered(area: Area2D):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_672325933__on_area_entered, [area], 1485673063)
	else:
		vanilla_672325933__on_area_entered(area)
