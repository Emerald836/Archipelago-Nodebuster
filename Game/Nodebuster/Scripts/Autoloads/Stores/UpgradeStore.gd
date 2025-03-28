extends Node

var data: Array[Upgrade] = [
	Upgrade.new({
		"id": "Damage1",
		"name": "power",
		"description": "+1 damage",
		"resource_type": ResourceType.BITS,
		"costs": [1, 2, 3, 3, 4, 5, 7, 9, 11, 13, 15, 20, 25, 30, 35],
	}),
	Upgrade.new({
		"id": "Health1",
		"name": "endurance",
		"description": "+4 max health",
		"resource_type": ResourceType.BITS,
		"costs": [2, 3, 4, 5, 6, 7, 8, 10, 11, 12],
	}),
	Upgrade.new({
		"id": "SpawnRate1",
		"name": "crowding",
		"description": "+50% spawn rate",
		"resource_type": ResourceType.BITS,
		"costs": [2, 4, 6, 8, 10, 14, 20, 30, 50, 70, 100, 130, 160, 200, 250],
	}),
	Upgrade.new({
		"id": "Armor1",
		"name": "firewall",
		"description": "+0.2 armor",
		"resource_type": ResourceType.BITS,
		"costs": [8, 10, 14, 18, 22, 26, 30, 30, 30, 30],
	}),
	Upgrade.new({
		"id": "BitBoost1",
		"name": "bit boost",
		"description": "red enemies drop +1 Bits",
		"resource_type": ResourceType.SP,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Size1",
		"name": "influence",
		"description": "+10% attack size",
		"resource_type": ResourceType.BITS,
		"costs": [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
	}),
	Upgrade.new({
		"id": "BossArmor1",
		"name": "boss guard",
		"description": "+1 armor against bosses",
		"resource_type": ResourceType.BITS,
		"costs": [15, 18, 21, 26, 32, 38, 44, 50, 56, 62],
	}),
	Upgrade.new({
		"id": "HealthRegen1",
		"name": "repair tool",
		"description": "regenerate +0.1 health/sec",
		"resource_type": ResourceType.BITS,
		"costs": [25, 25, 25, 30, 30],
	}),
	Upgrade.new({
		"id": "NodeFinder1",
		"name": "node finder",
		"description": "+1% chance for blue enemies to spawn",
		"resource_type": ResourceType.BITS,
		"costs": [400, 1500, 3000, 5000, 10000],
	}),
	Upgrade.new({
		"id": "Salvaging1",
		"name": "salvaging",
		"description": "restore +1 health on enemy kill",
		"resource_type": ResourceType.BITS,
		"costs": [100, 125, 150, 175, 200],
	}),
	Upgrade.new({
		"id": "DamagePerEnemy1",
		"name": "connection buster",
		"description": "attack deals +5% damage per enemy in area",
		"resource_type": ResourceType.BITS,
		"costs": [50, 100, 200, 500, 1000],
	}),
	Upgrade.new({
		"id": "BossDamage1",
		"name": "giant slayer",
		"description": "+50% damage against bosses",
		"resource_type": ResourceType.BITS,
		"costs": [60, 80, 100, 160, 300, 500, 700, 1000, 1300, 1600],
	}),
	Upgrade.new({
		"id": "AttackSpeed1",
		"name": "repeating",
		"description": "+20% attack speed",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "BonusDropChance1",
		"name": "plundering",
		"description": "+10% chance for double resource drops",
		"resource_type": ResourceType.BITS,
		"costs": [150, 400, 1000, 4000, 10000],
	}),
	Upgrade.new({
		"id": "ExplodersChance",
		"name": "spawn exploders",
		"description": "+5% chance to spawn enemies that explode on death",
		"resource_type": ResourceType.NODES,
		"costs": [3],
	}),
	Upgrade.new({
		"id": "Health2",
		"name": "better endurance",
		"description": "+12 max health",
		"resource_type": ResourceType.BITS,
		"costs": [60, 65, 70, 75, 80, 85, 90, 95],
	}),
	Upgrade.new({
		"id": "Armor2",
		"name": "antivirus",
		"description": "+0.6 armor",
		"resource_type": ResourceType.BITS,
		"costs": [150, 170, 190, 200, 210],
	}),
	Upgrade.new({
		"id": "Lifesteal1",
		"name": "sapper",
		"description": "restore +0.5 health when hitting an enemy",
		"resource_type": ResourceType.NODES,
		"costs": [2, 3, 4, 5, 6],
	}),
	Upgrade.new({
		"id": "Damage2",
		"name": "proficiency",
		"description": "+3 damage",
		"resource_type": ResourceType.BITS,
		"costs": [200, 210, 220, 230, 240, 260, 280, 300, 320, 340],
	}),
	Upgrade.new({
		"id": "PickupRadius1",
		"name": "magnet",
		"description": "+50% pickup range",
		"resource_type": ResourceType.BITS,
		"costs": [300, 1400, 4000, 15000, 70000],
	}),
	Upgrade.new({
		"id": "HealthRegen2",
		"name": "self-repair",
		"description": "regenerate +4 health/sec",
		"resource_type": ResourceType.SP,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Milestones",
		"name": "milestones",
		"description": "unlock the milestones tab",
		"resource_type": ResourceType.NODES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Salvaging2",
		"name": "skilled salvager",
		"description": "restore +8 health on enemy kill",
		"resource_type": ResourceType.NODES,
		"costs": [12],
	}),
	Upgrade.new({
		"id": "AttackSpeed2",
		"name": "repeat-repeating",
		"description": "+20% attack speed",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "SpawnRate2",
		"name": "swarming",
		"description": "+200% spawn rate",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "NodeBoost1",
		"name": "node boost",
		"description": "blue enemies drop +1 Nodes",
		"resource_type": ResourceType.SP,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "ArmorPerEnemy1",
		"name": "swarm defense system",
		"description": "+2% armor per enemy in area",
		"resource_type": ResourceType.BITS,
		"costs": [300, 350, 400, 450, 500, 650, 800, 1000, 1200, 1600],
	}),
	Upgrade.new({
		"id": "Armor3",
		"name": "bolster",
		"description": "+2 armor",
		"resource_type": ResourceType.BITS,
		"costs": [450, 460, 480, 500, 500, 510, 520, 530, 540, 550],
	}),
	Upgrade.new({
		"id": "DropHeal1",
		"name": "patcher",
		"description": "restore +0.5 health when picking up resources",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Health3",
		"name": "big heart",
		"description": "+80 max health",
		"resource_type": ResourceType.BITS,
		"costs": [500, 500, 525, 525, 550, 550, 600, 600, 600, 600],
	}),
	Upgrade.new({
		"id": "PulseBolts",
		"name": "pulse bolts",
		"description": "shoot projectiles outwards on each attack",
		"resource_type": ResourceType.NODES,
		"costs": [12],
	}),
	Upgrade.new({
		"id": "PulseBoltDamage1",
		"name": "bolt damage",
		"description": "+25% damage to pulse bolts",
		"resource_type": ResourceType.BITS,
		"costs": [400, 500, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000],
	}),
	Upgrade.new({
		"id": "PulseBoltCount1",
		"name": "bolt count",
		"description": "+1 pulse bolts per attack",
		"resource_type": ResourceType.SP,
		"costs": [1, 1, 1, 1, 1],
	}),
	Upgrade.new({
		"id": "ExplodersSize",
		"name": "exploder area",
		"description": "+15% exploder explosion size",
		"resource_type": ResourceType.SP,
		"costs": [1, 1, 1, 1, 1],
	}),
	Upgrade.new({
		"id": "MaxHealthHeal1",
		"name": "scaling regeneration",
		"description": "restore +1% max health/sec",
		"resource_type": ResourceType.NODES,
		"costs": [8, 10, 12, 14, 18, 22, 26, 30, 36, 45],
	}),
	Upgrade.new({
		"id": "Armor4",
		"name": "super armor",
		"description": "+5 armor",
		"resource_type": ResourceType.BITS,
		"costs": [700, 700, 725, 750, 750, 775, 775, 800, 800, 800],
	}),
	Upgrade.new({
		"id": "BossArmor2",
		"name": "anti-purple",
		"description": "+25% armor against bosses",
		"resource_type": ResourceType.NODES,
		"costs": [8, 10, 12, 14, 16, 20, 30, 45],
	}),
	Upgrade.new({
		"id": "Damage3",
		"name": "potency",
		"description": "+6 damage",
		"resource_type": ResourceType.NODES,
		"costs": [5, 6, 7, 8, 9, 10, 10, 10, 10, 10],
	}),
	Upgrade.new({
		"id": "Undamaged1",
		"name": "first strike",
		"description": "+25% damage to undamaged enemies",
		"resource_type": ResourceType.BITS,
		"costs": [1000, 1200, 1400, 1600, 1800, 2000],
	}),
	Upgrade.new({
		"id": "Execute1",
		"name": "last strike",
		"description": "+25% damage to enemies below 50% hp",
		"resource_type": ResourceType.BITS,
		"costs": [1000, 1200, 1400, 1600, 1800, 2000],
	}),
	Upgrade.new({
		"id": "CritChance1",
		"name": "crit chance",
		"description": "+10% critical hit chance",
		"resource_type": ResourceType.BITS,
		"costs": [1000, 2000, 3000, 4000, 6000, 8000, 12000, 16000, 20000, 24000],
	}),
	Upgrade.new({
		"id": "SpawnRate3",
		"name": "infesting",
		"description": "+100% spawn rate",
		"resource_type": ResourceType.BITS,
		"costs": [2000, 2200, 2400, 3000, 6000],
	}),
	Upgrade.new({
		"id": "Armor5",
		"name": "bit armor",
		"description": "+2 armor",
		"resource_type": ResourceType.BITS,
		"costs": [300, 300, 300, 300, 300, 300, 300, 300, 300, 300,
				300, 300, 300, 300, 300, 300, 300, 300, 300, 300,],
	}),
	Upgrade.new({
		"id": "Damage4",
		"name": "nodeblade",
		"description": "+25 damage",
		"resource_type": ResourceType.NODES,
		"costs": [50, 50, 50],
	}),
	Upgrade.new({
		"id": "Size2",
		"name": "domain expansion",
		"description": "+50% attack size",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "CryptoMine",
		"name": "crypto mine",
		"description": "Unlock the Crypto Mine tab",
		"resource_type": ResourceType.NODES,
		"costs": [50],
	}),
	Upgrade.new({
		"id": "Health4",
		"name": "transplant",
		"description": "+300 max health",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.01, 0.01, 0.01, 0.01, 0.01, 0.012, 0.01, 0.01, 0.01, 0.01],
	}),
	Upgrade.new({
		"id": "YellowSpawn1",
		"name": "processor acquisition",
		"description": "chance for yellow enemies to spawn",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.01,],
	}),
	Upgrade.new({
		"id": "Armor6",
		"name": "byte armor",
		"description": "+5 armor",
		"resource_type": ResourceType.BITS,
		"costs": [700, 700, 700, 700, 700, 700, 700, 700, 700, 700,
				700, 700, 700, 700, 700, 700, 700, 700, 700, 700,
				700, 700, 700, 700, 700, 700, 700, 700, 700, 700,],
	}),
	Upgrade.new({
		"id": "BossDamage2",
		"name": "colossus slayer",
		"description": "+100% damage against bosses",
		"resource_type": ResourceType.BITS,
		"costs": [5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000],
	}),
	Upgrade.new({
		"id": "Lifesteal2",
		"name": "drainer",
		"description": "restore 10 health when hitting an enemy",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.02, 0.02, 0.02],
	}),
	Upgrade.new({
		"id": "MovingPulser1",
		"name": "auto pulser",
		"description": "get a drone that occasionally attacks nearby enemies",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.05, 0.15, 0.4, 0.8, 2.0],
	}),
	Upgrade.new({
		"id": "Size3",
		"name": "b.i.g.",
		"description": "+100% attack size",
		"resource_type": ResourceType.CORES,
		"costs": [1, 1, 1],
	}),
	Upgrade.new({
		"id": "MovingPulserSize1",
		"name": "pulse thumper",
		"description": "+25% auto-pulser attack size",
		"resource_type": ResourceType.NODES,
		"costs": [50, 100, 150, 200, 300, 400],
	}),
	Upgrade.new({
		"id": "MovingPulserAttackSpeed1",
		"name": "fast pulsing",
		"description": "+20% auto-pulser attack speed",
		"resource_type": ResourceType.SP,
		"costs": [1, 1, 1, 1, 1],
	}),
	Upgrade.new({
		"id": "Health5",
		"name": "blood injection",
		"description": "+4000 max health",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.06, 0.07, 0.08],
	}),
	Upgrade.new({
		"id": "Lifesteal3",
		"name": "extraction",
		"description": "restore +1% max health when hitting an enemy",
		"resource_type": ResourceType.BITS,
		"costs": [10000, 50000],
	}),
	Upgrade.new({
		"id": "MaxHealthToArmor1",
		"name": "blood armor",
		"description": "get armor equal to +1% max health",
		"resource_type": ResourceType.NODES,
		"costs": [100, 150, 200, 250, 300],
	}),
	Upgrade.new({
		"id": "CritDamage1",
		"name": "crit damage",
		"description": "+50% crit damage",
		"resource_type": ResourceType.BITS,
		"costs": [6000, 8000, 10000, 12000, 14000, 16000, 18000, 20000, 22000, 24000],
	}),
	Upgrade.new({
		"id": "Damage5",
		"name": "netblade",
		"description": "+100 damage",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.05, 0.06, 0.07, 0.08, 0.09],
	}),
	Upgrade.new({
		"id": "Armor7",
		"name": "netarmor",
		"description": "+200 armor",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.06, 0.06, 0.06, 0.06, 0.06],
	}),
	Upgrade.new({
		"id": "FocusArmor1",
		"name": "focus armor",
		"description": "+50% armor when attacking 8 or less enemies",
		"resource_type": ResourceType.BITS,
		"costs": [8000, 9000, 10000, 11000, 12000],
	}),
	Upgrade.new({
		"id": "StealMaxHealth1",
		"name": "unending parasite",
		"description": "gain +1 max health permanently when defeating an enemy",
		"resource_type": ResourceType.NODES,
		"costs": [300],
	}),
	Upgrade.new({
		"id": "PulseBoltExplode",
		"name": "bolt burst",
		"description": "pulse bolts explode when they expire",
		"resource_type": ResourceType.NODES,
		"costs": [300],
	}),
	Upgrade.new({
		"id": "MovingPulserSize2",
		"name": "it's pulsing time",
		"description": "+50% auto-pulser attack size",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "PulseBoltCount2",
		"name": "bolt barrage",
		"description": "+2 pulse bolts per attack",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "PulseBoltDamage2",
		"name": "bolt lethality",
		"description": "+100% damage to pulse bolts",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.2, 0.25, 0.3],
	}),
	Upgrade.new({
		"id": "MovingPulserSpeed1",
		"name": "pulser pursuit",
		"description": "+20% auto-pulser movement speed",
		"resource_type": ResourceType.NODES,
		"costs": [100, 125, 150, 175, 200],
	}),
	Upgrade.new({
		"id": "Undamaged2",
		"name": "ambush",
		"description": "+100% damage to undamaged enemies",
		"resource_type": ResourceType.BITS,
		"costs": [10000, 12000, 15000, 20000],
	}),
	Upgrade.new({
		"id": "Execute2",
		"name": "finishing blow",
		"description": "+100% damage to enemies below 50% hp",
		"resource_type": ResourceType.BITS,
		"costs": [10000, 12000, 15000, 20000],
	}),
	Upgrade.new({
		"id": "MaxHealthHeal2",
		"name": "instant repair",
		"description": "restore +2% max health/sec",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.08, 0.08, 0.08, 0.08, 0.08],
	}),
	Upgrade.new({
		"id": "RampingDamage1",
		"name": "learning",
		"description": "gain +1% damage every second during session",
		"resource_type": ResourceType.BITS,
		"costs": [20000, 100000, 200000],
	}),
	Upgrade.new({
		"id": "EnemyDeathPulseBolts",
		"name": "bit explosion",
		"description": "all destroyed enemies have +1% chance to explode into pulse bolts",
		"resource_type": ResourceType.BITS,
		"costs": [10000, 11000, 12000, 13000, 14000, 15000],
	}),
	Upgrade.new({
		"id": "SpawnRate4",
		"name": "overloaded",
		"description": "+400% spawn rate",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.1, 0.1, 0.1, 0.12, 0.12],
	}),
	Upgrade.new({
		"id": "StealMaxHealth2",
		"name": "parasite evolution",
		"description": "increase max health permanently gained to +3 per enemy killed",
		"resource_type": ResourceType.NODES,
		"costs": [600],
	}),
	Upgrade.new({
		"id": "MaxHealthToArmor2",
		"name": "blood visage",
		"description": "get armor equal to +5% max health",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.5],
	}),
	Upgrade.new({
		"id": "RampingArmor1",
		"name": "growing",
		"description": "gain +1% armor every second during session",
		"resource_type": ResourceType.BITS,
		"costs": [50000, 100000, 120000, 140000, 200000],
	}),
	Upgrade.new({
		"id": "Health6",
		"name": "indomitable",
		"description": "+50000 max health",
		"resource_type": ResourceType.NODES,
		"costs": [600, 600, 600, 600, 600],
	}),
	Upgrade.new({
		"id": "StealMaxHealth3",
		"name": "insatiable",
		"description": "increase max health permanently gained to +8 per enemy killed",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.6],
	}),
	Upgrade.new({
		"id": "LightningChance1",
		"name": "lightning rod",
		"description": "+5% chance to create chaining lightning when hitting an enemy",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.7, 1.0, 1.3, 2.0, 3.0],
	}),
	Upgrade.new({
		"id": "LightningChainCount1",
		"name": "chaining",
		"description": "lightning chains +1 times",
		"resource_type": ResourceType.SP,
		"costs": [1, 1, 1, 1, 1, 1, 1, 1],
	}),
	Upgrade.new({
		"id": "LightningDamage1",
		"name": "thundering",
		"description": "+50% lightning damage",
		"resource_type": ResourceType.NODES,
		"costs": [500, 600, 700, 800, 900, 1000, 1100, 1200],
	}),
	Upgrade.new({
		"id": "CritDamage2",
		"name": "big crit",
		"description": "+200% crit damage",
		"resource_type": ResourceType.NETCOIN,
		"costs": [0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.0],
	}),
	Upgrade.new({
		"id": "MaxHealthToDamage1",
		"name": "bloodblade",
		"description": "get damage equal to +0.1% of max health",
		"resource_type": ResourceType.BITS,
		"costs": [100000],
	}),
	Upgrade.new({
		"id": "Health7",
		"name": "beyond",
		"description": "+100000 max health",
		"resource_type": ResourceType.BITS,
		"costs": [80000, 80000, 80000, 80000, 80000,],
	}),
	Upgrade.new({
		"id": "Infinity1",
		"name": "to infinity",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity2",
		"name": "going nowhere",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity3",
		"name": "void",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity4",
		"name": "no return",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity5",
		"name": "where",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity6",
		"name": "in the distance",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity7",
		"name": "something happens",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity8",
		"name": "event horizon",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Infinity9",
		"name": "singularity",
		"description": "???",
		"resource_type": ResourceType.CORES,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "Laboratory",
		"name": "the lab",
		"description": "unlock the laboratory tab",
		"resource_type": ResourceType.BITS,
		"costs": [1],
	}),
	Upgrade.new({
		"id": "YellowSpawn2",
		"name": "endless",
		"description": "increased yellow enemy spawn rate",
		"resource_type": ResourceType.NODES,
		"costs": [1000],
	}),
	Upgrade.new({
		"id": "AutoCollect",
		"name": "auto-collect",
		"description": "+10% chance to automatically collect enemy drops when dropped",
		"resource_type": ResourceType.NODES,
		"costs": [300, 500, 1000, 2000, 4000, 6000, 8000, 10000],
	}),
]

var _data_dict: Dictionary = {}

func vanilla_4280674294__ready() -> void:
	for upgrade: Upgrade in data:
		_data_dict[upgrade.id] = upgrade

func vanilla_4280674294_search(upgrade_id: String) -> Upgrade:
	return _data_dict.get(upgrade_id, null)

func vanilla_4280674294_reset() -> void:
	for upgrade: Upgrade in data:
		upgrade.curr_level = 0

func vanilla_4280674294_save() -> Dictionary:
	# Key: Upgrade id, Value: level of the upgrade
	var save: Dictionary = {}
	for upgrade: Upgrade in data:
		save[upgrade.id] = upgrade.curr_level
	return save

func vanilla_4280674294_load_save(save: Dictionary) -> void:
	reset()
	for upgrade_id: String in save:
		var upgrade: Upgrade = search(upgrade_id)
		if upgrade:
			upgrade.curr_level = clampi(save[upgrade_id], 0, upgrade.get_max_level())
			
			# Apply upgrade effects
			for level: int in upgrade.curr_level:
				Refs.upgrade_processor.gain_upgrade(upgrade, level)


# ModLoader Hooks - The following code has been automatically added by the Godot Mod Loader.


func _ready():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4280674294__ready, [], 2987364842)
	else:
		vanilla_4280674294__ready()


func search(upgrade_id: String) -> Upgrade:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4280674294_search, [upgrade_id], 3754530444)
	else:
		return vanilla_4280674294_search(upgrade_id)


func reset():
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4280674294_reset, [], 1544262681)
	else:
		vanilla_4280674294_reset()


func save() -> Dictionary:
	if _ModLoaderHooks.any_mod_hooked:
		return _ModLoaderHooks.call_hooks(vanilla_4280674294_save, [], 1868934853)
	else:
		return vanilla_4280674294_save()


func load_save(save: Dictionary):
	if _ModLoaderHooks.any_mod_hooked:
		_ModLoaderHooks.call_hooks(vanilla_4280674294_load_save, [save], 4093177444)
	else:
		vanilla_4280674294_load_save(save)
