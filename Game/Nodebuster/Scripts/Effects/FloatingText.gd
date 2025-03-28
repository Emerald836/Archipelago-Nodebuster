class_name FloatingText
extends RichTextLabel

var tween: Tween

func vanilla_1499225055__ready() -> void:
	bbcode_enabled = true
	fit_content = true
	scroll_active = false
	anchor_left = 0
	anchor_right = 0
	anchor_top = 0
	anchor_bottom = 0
	autowrap_mode = TextServer.AUTOWRAP_OFF

func vanilla_1499225055_setup(text_string: String, pos: Vector2, duration: float, color: Color) -> void:
	add_theme_color_override("default_color", color)
	
	text = text_string
	propagate_notification(NOTIFICATION_VISIBILITY_CHANGED)
	
	global_position = pos-size/2
	
	visible_ratio = 0.0
	
	tween = create_tween()
	tween.set_parallel()
	
	tween.tween_property(self, "position:y", position.y - 15, 0.3)\
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property(self, "visible_ratio", 1.0, 0.2)
	
	var timer = MyTimer.create_repeating(duration / 2.5, 0.8)
	timer.repeated.connect(_on_repeat)
	timer.killed.connect(queue_free)

func vanilla_1499225055__on_repeat():
	visible = not visible



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1499225055__ready, [], 3587281043)
	else:
		vanilla_1499225055__ready()


func setup(text_string: String, pos: Vector2, duration: float, color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1499225055_setup, [text_string, pos, duration, color], 3906338928)
	else:
		vanilla_1499225055_setup(text_string, pos, duration, color)


func _on_repeat():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_1499225055__on_repeat, [], 81904955)
	else:
		return vanilla_1499225055__on_repeat()
