class_name SceneTransition
extends AnimatedSprite2D

@onready var trans_in: AnimatedSprite2D = $TransitionIn
@onready var transition_text: Label = $TransitionText

var timer: TimeInstance

func vanilla_1049596831__ready() -> void:
	Refs.scene_transition = self

func vanilla_1049596831_transition_in(text: String) -> void:
	show()
	Globals.lock_mouse(self)
	SFX.play(Sound.TRANSITION_IN, 0)
	BGM.change_settings(0.7, 500, 0.5)
	frame = 0
	trans_in.frame = 0
	trans_in.play("default")
	
	transition_text.text = text
	transition_text.propagate_notification(NOTIFICATION_VISIBILITY_CHANGED)
	transition_text.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	transition_text.position = round(transition_text.position)
	transition_text.visible_ratio = 0
	transition_text.show()
	
	if timer:
		timer.kill()
	
	await MyTimer.wait(0.2)
	
	var t = create_tween()
	t.tween_property(transition_text, "visible_ratio", 1.0, 0.3)
	timer = MyTimer.create_repeating(0.04, 1, 14)
	timer.repeated.connect(_on_repeat)
	await t.finished
	await MyTimer.wait(0.4)

func vanilla_1049596831__on_repeat() -> void:
	transition_text.visible = not transition_text.visible

func vanilla_1049596831_transition_out() -> void:
	trans_in.frame = trans_in.sprite_frames.get_frame_count("default")
	play("default")
	SFX.play(Sound.TRANSITION_OUT, 0)
	await animation_finished
	hide()
	Globals.unlock_mouse(self)

func vanilla_1049596831_set_color(color: Color) -> void:
	self_modulate = color
	trans_in.self_modulate = color


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1049596831__ready, [], 335517779)
	else:
		vanilla_1049596831__ready()


func transition_in(text: String):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1049596831_transition_in, [text], 4266919008)
	else:
		await vanilla_1049596831_transition_in(text)


func _on_repeat():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1049596831__on_repeat, [], 911060219)
	else:
		vanilla_1049596831__on_repeat()


func transition_out():
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_1049596831_transition_out, [], 3369380673)
	else:
		await vanilla_1049596831_transition_out()


func set_color(color: Color):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1049596831_set_color, [color], 4084245513)
	else:
		vanilla_1049596831_set_color(color)
