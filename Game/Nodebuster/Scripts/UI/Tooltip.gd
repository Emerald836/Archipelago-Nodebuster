class_name Tooltip
extends ScreenControl

@onready var tooltip_label: MaxSizeRichTextLabel = %TooltipLabel


func vanilla_3802526991__ready() -> void:
	resized.connect(_on_resized)

func vanilla_3802526991_set_text(text: String) -> void:
	rotation = 0
	scale = Vector2.ONE
	tooltip_label.reset()
	tooltip_label.text = text
	spring()
	show()

func vanilla_3802526991_spring() -> void:
	Springer.squash(self, -0.1, 0.3, 1, 1000, 18)
	Springer.rotate(self, 7)

func vanilla_3802526991__on_resized() -> void:
	pivot_offset = size/2


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3802526991__ready, [], 1863667139)
	else:
		vanilla_3802526991__ready()


func set_text(text: String):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3802526991_set_text, [text], 955320223)
	else:
		vanilla_3802526991_set_text(text)


func spring():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3802526991_spring, [], 2644479362)
	else:
		vanilla_3802526991_spring()


func _on_resized():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3802526991__on_resized, [], 3412904864)
	else:
		vanilla_3802526991__on_resized()
