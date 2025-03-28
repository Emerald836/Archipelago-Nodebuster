extends RichTextLabel

func vanilla_1070809489__ready() -> void:
	position = Vector2(4000, 4000)
	size = Vector2.ZERO
	fit_content = true
	bbcode_enabled = true
	scroll_active = false
	autowrap_mode = TextServer.AUTOWRAP_OFF

# Get the size of the RTL if it contains the given String
func vanilla_1070809489_get_string_size(string: String) -> Vector2:
	text = string
	propagate_notification(NOTIFICATION_VISIBILITY_CHANGED)
	return size


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1070809489__ready, [], 2602464197)
	else:
		vanilla_1070809489__ready()


func get_string_size(string: String) -> Vector2:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1070809489_get_string_size, [string], 3258624993)
	else:
		return vanilla_1070809489_get_string_size(string)
