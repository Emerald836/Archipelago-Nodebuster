extends Node

var timers: Array = []
var physics_frame_timers: Array = []

func vanilla_4284904425__ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func vanilla_4284904425__process(delta: float) -> void:
	var realtime_delta: float = delta / Engine.time_scale
	var paused: bool = get_tree().paused
	
	for i in range(timers.size() - 1, -1, -1):
		if paused and not timers[i].ignore_pause:
			continue
		if timers[i].realtime: timers[i].update(realtime_delta)
		else: timers[i].update(delta)
		if timers[i].is_killed:
			timers[i].killed.emit()
			timers.remove_at(i)
		elif timers[i].time_remaining <= 0:
			timers[i].total_time *= timers[i].decrement_ratio
			if timers[i].total_time <= 0.0167 or timers[i].done_repeating():
				timers[i].killed.emit()
				timers[i].completed.emit()
				timers.remove_at(i)
			else:
				timers[i].time_remaining = timers[i].total_time
				timers[i].curr_repeats += 1
				timers[i].repeated.emit()

func vanilla_4284904425_create(time: float, ignore_pause: bool = false) -> TimeInstance:
	var timer = TimeInstance.new(time)
	timer.ignore_pause = ignore_pause
	timers.append(timer)
	return timer

# Easier way to await some time instead of needed to manually await completed signal
func vanilla_4284904425_wait(time: float, ignore_pause: bool = false) -> void:
	await create(time, ignore_pause).completed

func vanilla_4284904425_create_on_complete(time: float, method: Callable) -> TimeInstance:
	var timer = create(time)
	timer.on_complete.connect(method)
	return timer

# Repeating timer that emits after 'time' seconds.
# Decrement_ratio sets ratio to decrease 'time' by with each emission
# If decrement_ratio >= 1, then timer won't be naturally stopped ever!
# (unless num_repeats is specified)
func vanilla_4284904425_create_repeating(time: float, decrement_ratio: float,
num_repeats: int = -1) -> TimeInstance:
	var timer = TimeInstance.new(time)
	timer.num_repeats = num_repeats
	timer.decrement_ratio = decrement_ratio
	timers.append(timer)
	return timer

func vanilla_4284904425__physics_process(delta):
	for i in range(physics_frame_timers.size() - 1, -1, -1):
		var timer: FrameInstance = physics_frame_timers[i]
		timer.update(delta)
		if timer.is_killed:
			timer.killed.emit()
			physics_frame_timers.remove_at(i)
		elif timer.frames_remaining <= 0:
			timer.killed.emit()
			timer.completed.emit()
			physics_frame_timers.remove_at(i)

# Timer that emits after some amount of physics frames
func vanilla_4284904425_create_physics_frame(frames: int) -> FrameInstance:
	var timer = FrameInstance.new(frames)
	physics_frame_timers.append(timer)
	return timer



# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425__ready, [], 3537111069)
	else:
		return vanilla_4284904425__ready()


func _process(delta: float):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4284904425__process, [delta], 1565630183)
	else:
		vanilla_4284904425__process(delta)


func create(time: float, ignore_pause: bool=false) -> TimeInstance:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425_create, [time, ignore_pause], 3693653149)
	else:
		return vanilla_4284904425_create(time, ignore_pause)


func wait(time: float, ignore_pause: bool=false):
	if _ModLoaderHooks.any_mod_hooked:
		await _ModLoaderHooks.call_hooks_async(vanilla_4284904425_wait, [time, ignore_pause], 1948462110)
	else:
		await vanilla_4284904425_wait(time, ignore_pause)


func create_on_complete(time: float, method: Callable) -> TimeInstance:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425_create_on_complete, [time, method], 2557325169)
	else:
		return vanilla_4284904425_create_on_complete(time, method)


func create_repeating(time: float, decrement_ratio: float, 
num_repeats: int=-1) -> TimeInstance:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425_create_repeating, [time, decrement_ratio, num_repeats], 2001358171)
	else:
		return vanilla_4284904425_create_repeating(time, decrement_ratio, num_repeats)


func _physics_process(delta):
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425__physics_process, [delta], 561160105)
	else:
		return vanilla_4284904425__physics_process(delta)


func create_physics_frame(frames: int) -> FrameInstance:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4284904425_create_physics_frame, [frames], 864374793)
	else:
		return vanilla_4284904425_create_physics_frame(frames)
