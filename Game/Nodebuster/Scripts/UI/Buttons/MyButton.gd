@tool
class_name MyButton
extends Button

signal hovered()
signal unhovered()

const DISABLED_COLOR: Color = Color("6c6c6c")

@export var outline_color: Color = MyColors.WHITE :
	set(val):
		outline_color = val
		if outline_rid:
			RenderingServer.canvas_item_set_self_modulate(outline_rid, outline_color)
@export var inline_color: Color = MyColors.BG :
	set(val):
		inline_color = val
		if inline_rid:
			RenderingServer.canvas_item_set_self_modulate(inline_rid, inline_color)
@export var main_color: Color = MyColors.BG :
	set(val):
		main_color = val
		if main_rid:
			RenderingServer.canvas_item_set_self_modulate(main_rid, main_color)


@onready var visuals: Control = %Visuals

# visuals_rid holds all visual RIDs
var visuals_rid: RID
var outline_rid: RID
var inline_rid: RID
var main_rid: RID

# Properties that only affect the button visual (nothing else)
var visual_scale: Vector2 = Vector2.ONE
var visual_dangle: float = 0

var is_mouse_over: bool = false
var is_button_down: bool = false

func vanilla_1165451268__ready() -> void:
	visuals_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(visuals_rid, visuals.get_canvas_item())
	RenderingServer.canvas_item_set_draw_behind_parent(visuals_rid, true)
	
	outline_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(outline_rid, visuals_rid)
	RenderingServer.canvas_item_add_rect(outline_rid,
			Rect2(Vector2.ZERO, Vector2(1,1)), Color.WHITE)
	RenderingServer.canvas_item_set_self_modulate(outline_rid, outline_color)
	
	inline_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(inline_rid, visuals_rid)
	RenderingServer.canvas_item_add_rect(inline_rid,
			Rect2(Vector2.ZERO, Vector2(1,1)), Color.WHITE)
	RenderingServer.canvas_item_set_self_modulate(inline_rid, inline_color)
	
	main_rid = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(main_rid, visuals_rid)
	RenderingServer.canvas_item_add_rect(main_rid,
			Rect2(Vector2.ZERO, Vector2(1,1)), Color.WHITE)
	RenderingServer.canvas_item_set_self_modulate(main_rid, main_color)
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func vanilla_1165451268__exit_tree() -> void:
	if is_queued_for_deletion():
		RenderingServer.free_rid(outline_rid)
		RenderingServer.free_rid(inline_rid)
		RenderingServer.free_rid(main_rid)
		RenderingServer.free_rid(visuals_rid)

func vanilla_1165451268__process(delta: float) -> void:
	if not is_visible_in_tree(): return
	if visuals_rid:
		RenderingServer.canvas_item_set_transform(visuals_rid,
				Transform2D(deg_to_rad(visual_dangle), visual_scale, 0, size/2))
	if outline_rid:
		RenderingServer.canvas_item_set_transform(outline_rid,
				Transform2D(0, size, 0, -size/2))
	if inline_rid:
		RenderingServer.canvas_item_set_transform(inline_rid,
				Transform2D(0, size-Vector2(2,2), 0, -size/2+Vector2(1,1)))
	if main_rid:
		RenderingServer.canvas_item_set_transform(main_rid,
				Transform2D(0, size-Vector2(4,4), 0, -size/2+Vector2(2,2)))

func vanilla_1165451268__on_mouse_entered() -> void:
	is_mouse_over = true
	refresh_color()
	hovered.emit()
	visuals.pivot_offset = visuals.size/2
	Springer.rotate(visuals, -6, 0, 600)
	SFX.play(Sound.BUTTON_HOVER, 0.1)

func vanilla_1165451268__on_mouse_exited() -> void:
	is_mouse_over = false
	refresh_color()
	unhovered.emit()

func vanilla_1165451268__on_button_down() -> void:
	Springer.squash(visuals, 0.08, -0.1, 1, 500, 12)
	is_button_down = true
	refresh_color()
	SFX.play(Sound.BUTTON_DOWN)

func vanilla_1165451268__on_button_up() -> void:
	is_button_down = false
	refresh_color()
	SFX.play(Sound.BUTTON_UP)

func vanilla_1165451268__pressed() -> void:
	Jumper.jump(self, Vector2.UP, 8, 0.1)
	Springer.squash(visuals, 0.2, -0.3, 1, 500, 12)
	Springer.rotate(visuals, 3, 0, 300)

func vanilla_1165451268_set_enabled(val: bool) -> void:
	disabled = not val
	refresh_color()

func vanilla_1165451268_get_main_color() -> Color:
	if disabled:
		if is_mouse_over: return lerp(DISABLED_COLOR, Color.WHITE, 0.2)
		else: return DISABLED_COLOR
	elif is_button_down:
		if is_mouse_over: return lerp(main_color, Color.WHITE, 0.3)
		else: return lerp(main_color, Color.WHITE, 0.2)
	else:
		if is_mouse_over: return lerp(main_color, Color.WHITE, 0.2)
		else: return main_color

func vanilla_1165451268_refresh_color() -> void:
	if main_rid:
		RenderingServer.canvas_item_set_self_modulate(main_rid, get_main_color())


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__ready, [], 860511352)
	else:
		vanilla_1165451268__ready()


func _exit_tree():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__exit_tree, [], 2075421036)
	else:
		vanilla_1165451268__exit_tree()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__process, [delta], 3031332354)
	else:
		vanilla_1165451268__process(delta)


func _on_mouse_entered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__on_mouse_entered, [], 2303181294)
	else:
		vanilla_1165451268__on_mouse_entered()


func _on_mouse_exited():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__on_mouse_exited, [], 601875274)
	else:
		vanilla_1165451268__on_mouse_exited()


func _on_button_down():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__on_button_down, [], 296841042)
	else:
		vanilla_1165451268__on_button_down()


func _on_button_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__on_button_up, [], 919214719)
	else:
		vanilla_1165451268__on_button_up()


func _pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268__pressed, [], 3020062905)
	else:
		vanilla_1165451268__pressed()


func set_enabled(val: bool):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268_set_enabled, [val], 4025418714)
	else:
		vanilla_1165451268_set_enabled(val)


func get_main_color() -> Color:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1165451268_get_main_color, [], 3993364294)
	else:
		return vanilla_1165451268_get_main_color()


func refresh_color():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1165451268_refresh_color, [], 177953937)
	else:
		vanilla_1165451268_refresh_color()
