class_name MilestonesPage
extends Node2D

const _milestone_entry = preload("res://Scenes/Shop/MilestoneEntry.tscn")

@onready var milestone_vbox: VBoxContainer = %MilestoneVBox
@onready var notification_dot: TextureRect = %NotificationDot

func vanilla_3539397824__ready() -> void:
	for milestone: Milestone in MilestoneStore.data:
		var entry: MilestoneEntry = _milestone_entry.instantiate()
		milestone_vbox.add_child(entry)
		entry.load_milestone(milestone)
		entry.claimed.connect(_on_milestone_claimed.bind(entry))
	update_notification_dot()

func vanilla_3539397824__on_milestone_claimed(entry: MilestoneEntry) -> void:
	entry.set_claimed()
	Refs.upgrade_processor.gain_milestone(entry.milestone)
	update_notification_dot()

func vanilla_3539397824_update_notification_dot() -> void:
	notification_dot.hide()
	for entry: MilestoneEntry in milestone_vbox.get_children():
		if entry.is_claimable():
			notification_dot.show()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3539397824__ready, [], 84379188)
	else:
		vanilla_3539397824__ready()


func _on_milestone_claimed(entry: MilestoneEntry):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3539397824__on_milestone_claimed, [entry], 698767353)
	else:
		vanilla_3539397824__on_milestone_claimed(entry)


func update_notification_dot():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3539397824_update_notification_dot, [], 2076087695)
	else:
		vanilla_3539397824_update_notification_dot()
