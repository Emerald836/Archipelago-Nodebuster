@tool
class_name URLButotn
extends TextButton

@export var url: String = ""

func vanilla_379434449__ready() -> void:
	super._ready()
	pressed.connect(_on_pressed)

func vanilla_379434449__on_pressed() -> void:
	OS.shell_open(url)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_379434449__ready, [], 2206144517)
	else:
		vanilla_379434449__ready()


func _on_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_379434449__on_pressed, [], 1491070146)
	else:
		vanilla_379434449__on_pressed()
