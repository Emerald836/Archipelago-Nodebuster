class_name ConfirmationPopup
extends PanelContainer

# True if yes, False if no
signal chosen(val: bool)

@onready var message: RichTextLabel = %Message
@onready var no: TextButton = %No
@onready var yes: TextButton = %Yes


func vanilla_3866565610__ready() -> void:
	no.pressed.connect(_on_no)
	yes.pressed.connect(_on_yes)

func vanilla_3866565610_setup(message_str: String, no_msg: String = "no", yes_msg: String = "yes") -> void:
	message.text = "[center]%s[/center]" % message_str
	no.btn_text = no_msg
	yes.btn_text = yes_msg

func vanilla_3866565610__on_no() -> void:
	chosen.emit(false)

func vanilla_3866565610__on_yes() -> void:
	chosen.emit(true)



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3866565610__ready, [], 1253895390)
	else:
		vanilla_3866565610__ready()


func setup(message_str: String, no_msg: String="no", yes_msg: String="yes"):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3866565610_setup, [message_str, no_msg, yes_msg], 2924576603)
	else:
		vanilla_3866565610_setup(message_str, no_msg, yes_msg)


func _on_no():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3866565610__on_no, [], 1250659202)
	else:
		vanilla_3866565610__on_no()


func _on_yes():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3866565610__on_yes, [], 2617059766)
	else:
		vanilla_3866565610__on_yes()
