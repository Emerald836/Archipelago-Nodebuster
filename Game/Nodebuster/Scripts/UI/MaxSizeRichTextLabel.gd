class_name MaxSizeRichTextLabel
extends RichTextLabel

# If label exceeds max_width, automatically change it to wrap
@export var max_width: float = 100.0


func vanilla_3735365840__ready() -> void:
	resized.connect(_on_resized)

func vanilla_3735365840__on_resized() -> void:
	if size.x > max_width:
		custom_minimum_size.x = max_width
		autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		size.x = max_width

func vanilla_3735365840_reset() -> void:
	custom_minimum_size.x = 0
	autowrap_mode = TextServer.AUTOWRAP_OFF


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3735365840__ready, [], 286690884)
	else:
		vanilla_3735365840__ready()


func _on_resized():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3735365840__on_resized, [], 1293911233)
	else:
		vanilla_3735365840__on_resized()


func reset():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3735365840_reset, [], 160918835)
	else:
		vanilla_3735365840_reset()
