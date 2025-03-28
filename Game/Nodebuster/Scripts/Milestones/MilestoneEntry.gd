class_name MilestoneEntry
extends PanelContainer

signal claimed()

@onready var icon: TextureRect = %Icon
@onready var milestone_name: RichTextLabel = %MilestoneName
@onready var unlock_condition: RichTextLabel = %UnlockCondition
@onready var reward: RichTextLabel = %Reward
@onready var claim_btn: TextButton = %ClaimBtn

var milestone: Milestone

func vanilla_3528796107__ready() -> void:
	claim_btn.pressed.connect(_on_claimed)

func vanilla_3528796107_load_milestone(_milestone: Milestone) -> void:
	milestone = _milestone
	
	var progress: float = clamp(Refs.upgrade_processor.check_milestone(milestone), 0.0, 1.0)
	claim_btn.set_enabled(progress >= 1.0)
	
	icon.texture = milestone.icon
	milestone_name.text = milestone.name
	unlock_condition.text = "%s %s(%.1f%%)[/color]" % [milestone.unlock_desc,
			Utils.hex(MyColors.GREEN), progress*100.0]
	reward.text = Utils.colored("REWARD: " + milestone.reward, MyColors.YELLOW)
	
	if milestone.claimed:
		set_claimed()

func vanilla_3528796107_is_claimable() -> bool:
	return not claim_btn.disabled

func vanilla_3528796107_set_claimed() -> void:
	modulate = lerp(Color.WHITE, MyColors.BG, 0.7)
	claim_btn.set_enabled(false)
	claim_btn.btn_text = "claimed"
	milestone.claimed = true

func vanilla_3528796107__on_claimed() -> void:
	claimed.emit()


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3528796107__ready, [], 2376506751)
	else:
		vanilla_3528796107__ready()


func load_milestone(_milestone: Milestone):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3528796107_load_milestone, [_milestone], 2577499034)
	else:
		vanilla_3528796107_load_milestone(_milestone)


func is_claimable() -> bool:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_3528796107_is_claimable, [], 3231073504)
	else:
		return vanilla_3528796107_is_claimable()


func set_claimed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3528796107_set_claimed, [], 886378853)
	else:
		vanilla_3528796107_set_claimed()


func _on_claimed():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_3528796107__on_claimed, [], 924183957)
	else:
		vanilla_3528796107__on_claimed()
