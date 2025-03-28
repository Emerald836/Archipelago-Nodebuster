class_name UpgradeNode
extends Control

signal hovered()
signal unhovered()
signal clicked()


@export var upgrade_id: String
@export var connected_nodes: Array[UpgradeNode] = []

@onready var upgrade_icon: UpgradeIcon = %UpgradeIcon
@onready var button: Button = %Button


# Built at runtime. Key: connected UpgradeNode, Value: Line2D that connects me to that node
var connect_lines: Dictionary = {}

var upgrade: Upgrade


func vanilla_2370409006__ready() -> void:
	button.mouse_entered.connect(_on_mouse_entered)
	button.mouse_exited.connect(_on_mouse_exited)
	button.button_down.connect(_on_btn_down)
	button.button_up.connect(_on_btn_up)
	button.pressed.connect(_on_btn_pressed)
	
	upgrade = UpgradeStore.search(upgrade_id)
	upgrade_icon.load_upgrade(upgrade)
	
	State.get_resource_changed_signal(upgrade.resource_type).connect(refresh_ui)
	
	refresh_ui()

func vanilla_2370409006_refresh_ui() -> void:
	upgrade_icon.setup_outline_color()

func vanilla_2370409006_get_center() -> Vector2:
	return global_position + size/2

func vanilla_2370409006_spring() -> void:
	Springer.scale(upgrade_icon, 0.4)
	Springer.rotate(upgrade_icon, 12)

func vanilla_2370409006__on_mouse_entered() -> void:
	hovered.emit()
	SFX.play(Sound.BUTTON_HOVER, 0.1)

func vanilla_2370409006__on_mouse_exited() -> void:
	unhovered.emit()

func vanilla_2370409006__on_btn_pressed() -> void:
	clicked.emit()

func vanilla_2370409006__on_btn_down() -> void:
	SFX.play(Sound.BUTTON_DOWN)

func vanilla_2370409006__on_btn_up() -> void:
	SFX.play(Sound.BUTTON_UP)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__ready, [], 294127138)
	else:
		vanilla_2370409006__ready()


func refresh_ui():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006_refresh_ui, [], 1912368602)
	else:
		vanilla_2370409006_refresh_ui()


func get_center() -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_2370409006_get_center, [], 1961577646)
	else:
		return vanilla_2370409006_get_center()


func spring():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006_spring, [], 1074939361)
	else:
		vanilla_2370409006_spring()


func _on_mouse_entered():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__on_mouse_entered, [], 296078680)
	else:
		vanilla_2370409006__on_mouse_entered()


func _on_mouse_exited():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__on_mouse_exited, [], 1972709748)
	else:
		vanilla_2370409006__on_mouse_exited()


func _on_btn_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__on_btn_pressed, [], 600417602)
	else:
		vanilla_2370409006__on_btn_pressed()


func _on_btn_down():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__on_btn_down, [], 2275484004)
	else:
		vanilla_2370409006__on_btn_down()


func _on_btn_up():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_2370409006__on_btn_up, [], 1453465617)
	else:
		vanilla_2370409006__on_btn_up()
