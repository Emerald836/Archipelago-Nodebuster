class_name MyCamera
extends Camera2D


func vanilla_3485207078__ready() -> void:
	Refs.camera = self

func vanilla_3485207078_shake(magnitude: float = 3, duration: float = 0.3, frequency: float = 70) -> void:
	var strength: float = magnitude*Globals.screenshake_intensity
	Shaker.shake_property(self, "offset:x", strength, duration, frequency)
	Shaker.shake_property(self, "offset:y", strength, duration, frequency)

func vanilla_3485207078__input(event: InputEvent) -> void:
	pass
	#if event is InputEventMouseButton:
		#if event.is_pressed():
			#if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				#zoom += Vector2(0.1, 0.1)
			#elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				#zoom -= Vector2(0.1, 0.1)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3485207078__ready, [], 3324155930)
	else:
		vanilla_3485207078__ready()


func shake(magnitude: float=3, duration: float=0.3, frequency: float=70):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3485207078_shake, [magnitude, duration, frequency], 3117549074)
	else:
		vanilla_3485207078_shake(magnitude, duration, frequency)


func _input(event: InputEvent):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3485207078__input, [event], 3313822965)
	else:
		vanilla_3485207078__input(event)
