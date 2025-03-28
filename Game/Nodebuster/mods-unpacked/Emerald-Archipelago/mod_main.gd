extends "res://Scripts/Shop/UpgradeTree.gd"


var isUpgradeTree: bool
var upgradeTree: UpgradeTree
var milestonePage: MilestonesPage

var apClient: ArchipelagoClient

var upgrades: Dictionary

const MOD_NAME = "Emerald-Archipelago"
const MOD_VERSION = "0.5.1"
const LOG_NAME = MOD_NAME + "/mod_main"

var itemReceivedList: Array
var console: Control


var main_scene: MainScene


var milestoneUnlocked: bool = false
var cryptoUnlocked: bool = false
var labUnlocked: bool = false



const ArchipelagoClient = preload("res://mods-unpacked/Emerald-Archipelago/ap/ArchipelagoClient.gd")



var firstUpgradeTreeViewing: bool = false # Remove This

var upgradeDesc: UpgradeDescription


var scout_data: Dictionary


func _init() -> void:
	
	ModLoaderMod.add_hook(_upgrade_tree_ready,"res://Scripts/Shop/UpgradeTree.gd","_ready")
	ModLoaderMod.add_hook(_override_upgrade_visibility,"res://Scripts/Shop/UpgradeTree.gd","update_upgrade_visiblity")
	ModLoaderMod.add_hook(_on_override_upgrade_clicked,"res://Scripts/Shop/UpgradeTree.gd","_on_upgrade_clicked")
	ModLoaderMod.add_hook(_on_override_milestone_claimed,"res://Scripts/Shop/MilestonesPage.gd","_on_milestone_claimed")
	ModLoaderMod.add_hook(_description_hook,"res://Scripts/UI/UpgradeDescription.gd","refresh_ui")




func _ready():
	
	get_tree().node_added.connect(_node_added)
	get_tree().node_removed.connect(_node_removed)
	
	
	# Make and connect archipelago client
	var apc = ArchipelagoClient.new()
	call_deferred("add_child",apc)
	apClient = apc
	apc.item_received.connect(_recieve_check)
	apc.connected.connect(_connected_to_room)
	apc.location_scout_retrieved.connect(_get_scout_data)
	
	# Add the console scene
	_add_console_scene(self)
	
	
	ModLoaderLog.success("Archipelago mod v%s initialized" % MOD_VERSION, LOG_NAME)



func _get_scout_data(scout_data) -> void:
	print(scout_data)


func _connected_to_room() -> void: ## When the client is connected to room
	firstUpgradeTreeViewing = true
	if is_instance_valid(Refs.curr_scn) == false:
		Refs.curr_scn == self


func _add_console_scene(node:Node) -> void: ## Spawn console scene
	var console_scene = load("res://mods-unpacked/Emerald-Archipelago/ArchipelagoConsole.tscn").instantiate()
	node.call_deferred("add_child",console_scene)
	console_scene.archipelagoMain = self


func _node_added(node:Node) -> void:
	if node is MainScene:
		main_scene = node
		apClient.connected.connect(main_scene._on_new_game)
	if node is UpgradeTree:
		isUpgradeTree = true
		upgradeTree = node
	if node is MilestonesPage:
		milestonePage = node

func _node_removed(node:Node) -> void:
	if node is UpgradeTree:
		isUpgradeTree = false
		upgradeTree = null
	if node is MilestonesPage:
		milestonePage = null



func _reset_stats() -> void:
	State.bonus_max_health = 0
	State.stats = Stats.new()
	State.curr_prestige = 0
	State.max_prestige = 0

var loc_ids: Array

func _upgrade_tree_ready(chain: ModLoaderHookChain) -> void: ## Upgrade tree ready. After we get the upgrade nodes we are gonna want to look through the checked locations and set the upgrade nodes current level
	if isUpgradeTree == false: return
	
	print("is ready")
	var children: Array[Node] = upgradeTree.get_children()
	for child: Node in children:
		if child is UpgradeNode:
			upgrades[child.name] = child
			for connected_node: UpgradeNode in child.connected_nodes:
				upgradeTree.create_connection(child, connected_node)
				# Make sure all nodes are connected both ways
				if not connected_node.connected_nodes.has(child):
					connected_node.connected_nodes.append(child)
			
			child.hovered.connect(_on_hover_upgrade.bind(child))
			child.unhovered.connect(_on_unhover_upgrade)
			child.clicked.connect(_on_upgrade_clicked.bind(child))
	# Set visibility after all of the upgrade nodes connectinos were set.
	for upgrade_id in UpgradeStore._data_dict.keys():
		var upgrade = UpgradeStore._data_dict[upgrade_id]
		if upgrade.curr_level > 0:
			loc_ids.append(apClient._location_name_to_id[upgrade_id + "-" + upgrade.curr_level])
	apClient.sendScout(loc_ids)
	for child: Node in children:
		if child is UpgradeNode:
			upgradeTree.update_upgrade_visiblity(child)
	
	firstUpgradeTreeViewing = false
	for id in storeUpgrades:
		_check_recieved_item(id)
	
	if milestoneUnlocked:
		State.stats.milestones_unlocked = true
		Refs.curr_scn.show_milestones_btn()
	
	if cryptoUnlocked:
		State.stats.crypto_mine_unlocked = true
		Refs.curr_scn.show_crypto_mine_btn()
		
	if labUnlocked:
		State.stats.lab_unlocked = true
		Refs.curr_scn.show_lab_btn()
	
#	if State.stats.crypto_mine_unlocked == true:
#			print("Crypto Mine is unlocked")
	#		if is_instance_valid(Refs.curr_scn):
	#			Refs.curr_scn.show_crypto_mine_btn()
	#	if State.stats.lab_unlocked == true:
	#		if is_instance_valid(Refs.curr_scn):
	#			Refs.curr_scn.show_lab_btn()

func _on_milestone_rewarded(entry:MilestoneEntry) -> void: ## Gives the reward of the milestone if you gain a milestone
	Refs.upgrade_processor.gain_milestone(entry.milestone)


func _on_override_milestone_claimed(chain:ModLoaderHookChain, entry:MilestoneEntry) -> void: ## Sets the milestone entry to claimed and sends check event
	entry.set_claimed()
	print("Milestone reached: ",entry)
	# Remove the gain milestone so you dont recieve the rewards for claiming a milestone
	#Refs.upgrade_processor.gain_milestone(entry.milestone)
	_send_check(entry)
	milestonePage.update_notification_dot()


func _description_hook(upgrade:UpgradeNode) -> void:
	apClient.location_scout_retrieved
	if not upgrade: return
	upgradeDesc.upgrade_name.text = upgrade.name
	upgradeDesc.description.text = "[center]%s[/center]" % upgrade.description
	upgradeDesc.level.text = "[center]Lv. %d / %d[/center]" % [upgrade.curr_level, upgrade.get_max_level()]
	
	upgradeDesc.update_cost_text()
	propagate_notification(NOTIFICATION_VISIBILITY_CHANGED)


func _on_override_upgrade_clicked(chain:ModLoaderHookChain, upgrade_node:UpgradeNode) -> void:
	var upgrade: Upgrade = upgrade_node.upgrade
	if not upgrade.can_buy(): return
	var cost = upgrade.get_cost()
	State.lose_resource(upgrade.resource_type, cost)
	Refs.curr_scn.squash_resource(upgrade.resource_type)
	
	upgrade.curr_level += 1
	local_locations_checked[upgrade.id] = upgrade.curr_level # Somethig with this causes lab to crash
	# Remove gain upgrade so the player dosent get stats.
	#Refs.upgrade_processor.gain_upgrade(upgrade, upgrade.curr_level)
	
	_send_check(upgrade_node)
	
	Refs.upgrade_description.refresh_ui()
	Refs.upgrade_description.spring_level_up()
	upgrade_node.refresh_ui()
	upgrade_node.spring()
	
	update_upgrade_visiblity(upgrade_node)
	for connected_node: UpgradeNode in upgrade_node.connected_nodes:
		update_upgrade_visiblity(connected_node)



func _send_check(node:Node) -> void: ## When you get something from Nodebreaker. send it to the server
	if node is UpgradeNode:
		apClient.sendLocation(apClient._location_name_to_id[(str(node.upgrade.id) + "-" + str(node.upgrade.curr_level))])
		pass
	if node is MilestoneEntry:
		pass

var storeUpgrades: PackedInt64Array

func _recieve_check(itemID) -> void: ## When the server recieves a nodebreaker item. recieve it here
	#var itemName = apClient._getItemName(itemID)
	storeUpgrades.append(itemID)
	if is_instance_valid(Refs.curr_scn) == false: return
	if Refs.curr_scn != UpgradeTree: return
	_check_recieved_item(itemID)

func _check_recieved_item(itemID) -> void: ## Checks through all of the upgrades and if the upgrades id matches the item. Give the upgrade.
	var itemName = apClient._getItemName(itemID)
	for key in upgrades.keys():
		var value = upgrades[key]
		if value.upgrade.id != itemName:
			continue
		#_give_upgrade(value)
		print("Unlocked Item: ", itemName)
		return
	print("There is no upgrade with that itemID") # If not in upgrades check milestones.

func _input(event) -> void:
	if isUpgradeTree == false: return
	if event.is_action_pressed("up"):
		_override_upgrade_clicked(upgrades["18"])


var local_locations_checked: Dictionary = {}


func _get_checked_locataions() -> Dictionary:
	var upgrade_name_and_count: Dictionary = {}
	for id in apClient._checked_locations:
		var location_name: String = apClient._location_id_to_name[id]
		var split = location_name.split("-",true,1)
		if upgrade_name_and_count.has(split[0]):
			upgrade_name_and_count[split[0]] += 1
			continue
		upgrade_name_and_count[split[0]] = 1
	return upgrade_name_and_count



func _override_upgrade_visibility(chain: ModLoaderHookChain, upgrade_node: UpgradeNode) -> void:
	if isUpgradeTree == false: return
	if chain != null and firstUpgradeTreeViewing:
		var val = chain.execute_next([upgrade_node])
	
	
	if apClient._client != null:
		var _checked_locations: Dictionary = _get_checked_locataions()
		if _checked_locations.has(upgrade_node.upgrade.id):
			if local_locations_checked.has(upgrade_node.upgrade.id):
				if _checked_locations[upgrade_node.upgrade.id] <= local_locations_checked[upgrade_node.upgrade.id]:
					upgrade_node.upgrade.curr_level = local_locations_checked[upgrade_node.upgrade.id]
				else:
					upgrade_node.upgrade.curr_level = _checked_locations[upgrade_node.upgrade.id]
			else:
				upgrade_node.upgrade.curr_level = _checked_locations[upgrade_node.upgrade.id]
		elif local_locations_checked.has(upgrade_node.upgrade.id):
			upgrade_node.upgrade.curr_level = local_locations_checked[upgrade_node.upgrade.id]
		#if _checked_locations.has(upgrade_node.upgrade.id) or local_locations_checked.has(upgrade_node.upgrade.id):
			#upgrade_node.upgrade.curr_level = _checked_locations[upgrade_node.upgrade.id]
	
	if upgrade_node.upgrade.curr_level > 0:
		upgrade_node.visible = true
	if upgrade_node.upgrade.curr_level == 0:
		upgrade_node.modulate = lerp(Color.WHITE, MyColors.BG, 0.5)
	else:
		upgrade_node.modulate = Color.WHITE
	
	# Update tree's rect
	if upgrade_node.visible:
		upgradeTree.top_left.x = min(upgradeTree.top_left.x, upgrade_node.position.x)
		upgradeTree.top_left.y = min(upgradeTree.top_left.y, upgrade_node.position.y)
		upgradeTree.bot_right.x = max(upgradeTree.bot_right.x, upgrade_node.position.x+upgrade_node.size.x)
		upgradeTree.bot_right.y = max(upgradeTree.bot_right.y, upgrade_node.position.y+upgrade_node.size.y)
	
	# Node isn't visible: hide all connections
	if not upgrade_node.visible:
		for connected_node: UpgradeNode in upgrade_node.connect_lines:
			upgrade_node.connect_lines[connected_node].hide()
	# Node is visible: show all connections to other visible nodes
	else:
		for connected_node: UpgradeNode in upgrade_node.connect_lines:
			if connected_node.visible:
				upgrade_node.connect_lines[connected_node].show()


func _find_unlocked_sequenced_broken_upgrades() -> void:
	if isUpgradeTree == false: return
	var children: Array[Node] = upgradeTree.get_children()
	for child: Node in children:
		if child is UpgradeNode:
			#upgradeTree._override_upgrade_visibility(child)
			upgradeTree.update_upgrade_visiblity(child)

func _override_upgrade_clicked(upgrade_node: UpgradeNode) -> void:
	if isUpgradeTree == false: return
	var upgrade: Upgrade = upgrade_node.upgrade
	#if upgrade.is_maxed(): return
	# Remove gaining a level so when you get an item it dosen't count as buying the upgrade
	#upgrade.curr_level += 1
	Refs.upgrade_processor.gain_upgrade(upgrade, upgrade.curr_level)
	
	Refs.upgrade_description.refresh_ui()
	Refs.upgrade_description.spring_level_up()
	upgrade_node.refresh_ui()
	upgrade_node.spring()
	
	
	#_override_upgrade_visibility(null, upgrade_node)
	for connected_node: UpgradeNode in upgrade_node.connected_nodes:
		upgradeTree.update_upgrade_visiblity(connected_node)
	
	upgradeTree.refresh_all_nodes()
