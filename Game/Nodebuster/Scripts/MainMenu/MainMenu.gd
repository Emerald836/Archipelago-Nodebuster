class_name MainMenu
extends BaseScene

signal new_game()
signal continue_game()

@onready var game_title: Label = %GameTitle
@onready var type_cursor: ColorRect = %TypeCursor
@onready var title_font: Font = game_title.get_theme_font("font")

@onready var new_game_btn: TextButton = %NewGameBtn
@onready var continue_btn: TextButton = %ContinueBtn
@onready var options_btn: TextButton = %OptionsBtn
@onready var quit_btn: TextButton = %QuitBtn

@onready var credits_btn: TextButton = %CreditsBtn

var typing: bool = false
var typing_t: float = 0.0
var cursor_blink_timer: TimeInstance


func vanilla_1036109658__ready() -> void:
	new_game_btn.pressed.connect(_on_new_game_pressed)
	continue_btn.pressed.connect(_on_continue_pressed)
	options_btn.pressed.connect(_on_options_pressed)
	quit_btn.pressed.connect(_on_quit_pressed)
	credits_btn.pressed.connect(_on_credits_pressed)
	
	continue_btn.visible = Saver.has_save()
	game_title.visible_characters = 0

func vanilla_1036109658_setup() -> void:
	game_title.visible_characters = 0
	typing = true

func vanilla_1036109658__process(delta: float) -> void:
	if typing:
		typing_t += delta
		if typing_t >= 0.1:
			typing_t -= 0.1
			game_title.visible_characters += 1
			SFX.play(Sound.TYPE, 0.1)
			if game_title.visible_ratio >= 1.0:
				typing = false
				_on_finish_typing()
	
	var char_count: int = game_title.visible_characters
	var str: String = game_title.text.substr(0, char_count)
	var width: float = title_font.get_string_size(str, HORIZONTAL_ALIGNMENT_LEFT, -1,
			game_title.get_theme_font_size("font_size")).x
	type_cursor.global_position.x = game_title.global_position.x+width+2

func vanilla_1036109658__on_finish_typing() -> void:
	cursor_blink_timer = MyTimer.create_repeating(0.5, 1, -1)
	cursor_blink_timer.repeated.connect(_on_repeat)
func vanilla_1036109658__on_repeat() -> void:
	type_cursor.visible = not type_cursor.visible

func vanilla_1036109658__on_new_game_pressed() -> void:
	new_game.emit()

func vanilla_1036109658__on_continue_pressed() -> void:
	continue_game.emit()

func vanilla_1036109658__on_options_pressed() -> void:
	Refs.popups.add_popup(Refs._options.instantiate())
	Refs.popups.focus_curr()

func vanilla_1036109658__on_quit_pressed() -> void:
	get_tree().quit()

func vanilla_1036109658__on_credits_pressed() -> void:
	Refs.popups.add_popup(preload("res://Scenes/Popups/CreditsPopup.tscn").instantiate())
	Refs.popups.focus_curr()

func vanilla_1036109658__exit_tree() -> void:
	if cursor_blink_timer:
		cursor_blink_timer.kill()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__ready, [], 1167486030)
	else:
		vanilla_1036109658__ready()


func setup():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658_setup, [], 188797131)
	else:
		vanilla_1036109658_setup()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__process, [delta], 2319307608)
	else:
		vanilla_1036109658__process(delta)


func _on_finish_typing():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_finish_typing, [], 274529264)
	else:
		vanilla_1036109658__on_finish_typing()


func _on_repeat():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_repeat, [], 1054082678)
	else:
		vanilla_1036109658__on_repeat()


func _on_new_game_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_new_game_pressed, [], 1730563693)
	else:
		vanilla_1036109658__on_new_game_pressed()


func _on_continue_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_continue_pressed, [], 4146212943)
	else:
		vanilla_1036109658__on_continue_pressed()


func _on_options_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_options_pressed, [], 3737262678)
	else:
		vanilla_1036109658__on_options_pressed()


func _on_quit_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_quit_pressed, [], 1196773581)
	else:
		vanilla_1036109658__on_quit_pressed()


func _on_credits_pressed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__on_credits_pressed, [], 178925144)
	else:
		vanilla_1036109658__on_credits_pressed()


func _exit_tree():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_1036109658__exit_tree, [], 4069553218)
	else:
		vanilla_1036109658__exit_tree()
