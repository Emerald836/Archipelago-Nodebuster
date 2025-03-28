extends CanvasLayer
class_name ArchipelagoConsole

@onready var console_toggle = $ArchipelagoConsole/VBoxContainer/ConsoleToggle
@onready var console_input = $ArchipelagoConsole/VBoxContainer/ScrollContainer/ConsoleInput
@onready var console_text = $ArchipelagoConsole/VBoxContainer/ConsoleText
@onready var scroll_container = $ArchipelagoConsole/VBoxContainer/ScrollContainer


var archipelagoMain: Node

var messages: PackedStringArray


var _ap_client: ArchipelagoClient


func _ready():
	var mod_node = get_node("/root/ModLoader/Emerald-Archipelago")
	
	
	print(mod_node)
	_ap_client = mod_node.get_child(0)
	_ap_client.logInformations.connect(_new_message)


func _process(delta):
	scroll_container.scroll_horizontal += 1


func _new_message(message:String) -> void:
	print("Message recieved: ", message)
	console_text.append_text("\n"+message)
	archipelagoMain.console_history = console_text.text


func _check_cmd(message:String) -> void:
	if message.begins_with("archipelago.gg:"):
		try_connection(message)


func try_connection(message:String) -> void:
	print("try to connect")
	
	# Deconstruct the message to get the server and the players name.
	var split = message.split(" ",true,2)
	var server: String = ""
	var playerName: String = ""
	var password: String = ""
	if split.size() > 0:
		server = split[0]
	if split.size() > 1:
		playerName = split[1]
	if split.size() > 2:
		password = split[2]
	
	print(split)
	_ap_client.connectToServer(server,playerName,password)


func _on_console_input_text_submitted(new_text):
	
	_new_message(new_text)
	_check_cmd(new_text)
	console_input.clear()


func _on_console_toggle_toggled(toggled_on):
	console_input.visible = toggled_on
	console_text.visible = toggled_on
