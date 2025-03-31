from BaseClasses import ItemClassification
from typing import TypedDict, List

from BaseClasses import Item


base_id = 268000


class NodebusterItem(Item):
    name: str = "Nodebuster"


class ItemDict(TypedDict):
    name: str
    count: int
    classification: ItemClassification


upgrade_items: List[ItemDict] = [
    { "name": "Damage1", "count": 15, 'classification': ItemClassification.useful},
{ "name": "Health1", "count": 10, 'classification': ItemClassification.useful},
{ "name": "SpawnRate1", "count": 15, 'classification': ItemClassification.useful},
{ "name": "Armor1", "count": 10,'classification': ItemClassification.useful},
{ "name": "BitBoost1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Size1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "BossArmor1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "HealthRegen1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "NodeFinder1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Salvaging1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "DamagePerEnemy1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "BossDamage1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "AttackSpeed1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "BonusDropChance1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "ExplodersChance", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Health2", "count": 8 ,'classification': ItemClassification.useful},
{ "name": "Armor2", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Lifesteal1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Damage2", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "PickupRadius1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "HealthRegen2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Milestones", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Salvaging2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "AttackSpeed2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "SpawnRate2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "NodeBoost1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "ArmorPerEnemy1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "Armor3", "count": 10,'classification': ItemClassification.useful},
{ "name": "DropHeal1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Health3", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "PulseBolts", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "PulseBoltDamage1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "PulseBoltCount1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "ExplodersSize", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "MaxHealthHeal1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "Armor4", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "BossArmor2", "count": 8 ,'classification': ItemClassification.useful},
{ "name": "Damage3", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "Undamaged1", "count": 6 ,'classification': ItemClassification.useful},
{ "name": "Execute1", "count": 6 ,'classification': ItemClassification.useful},
{ "name": "CritChance1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "SpawnRate3", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Armor5", "count": 20 ,'classification': ItemClassification.useful},
{ "name": "Damage4", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "Size2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "CryptoMine", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Health4", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "YellowSpawn1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Armor6", "count": 30 ,'classification': ItemClassification.useful},
{ "name": "BossDamage2", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "Lifesteal2", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "MovingPulser1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Size3", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "MovingPulserSize1", "count": 6 ,'classification': ItemClassification.useful},
{ "name": "MovingPulserAttackSpeed1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Health5", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "Lifesteal3", "count": 2 ,'classification': ItemClassification.useful},
{ "name": "MaxHealthToArmor1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "CritDamage1", "count": 10 ,'classification': ItemClassification.useful},
{ "name": "Damage5", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Armor7", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "FocusArmor1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "StealMaxHealth1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "PulseBoltExplode", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "MovingPulserSize2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "PulseBoltCount2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "PulseBoltDamage2", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "MovingPulserSpeed1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Undamaged2", "count": 4 ,'classification': ItemClassification.useful},
{ "name": "Execute2", "count": 4 ,'classification': ItemClassification.useful},
{ "name": "MaxHealthHeal2", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "RampingDamage1", "count": 3 ,'classification': ItemClassification.useful},
{ "name": "EnemyDeathPulseBolts", "count": 6 ,'classification': ItemClassification.useful},
{ "name": "SpawnRate4", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "StealMaxHealth2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "MaxHealthToArmor2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "RampingArmor1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Health6", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "StealMaxHealth3", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "LightningChance1", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "LightningChainCount1", "count": 8 ,'classification': ItemClassification.useful},
{ "name": "LightningDamage1", "count": 8 ,'classification': ItemClassification.useful},
{ "name": "CritDamage2", "count": 8 ,'classification': ItemClassification.useful},
{ "name": "MaxHealthToDamage1", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "Health7", "count": 5 ,'classification': ItemClassification.useful},
{ "name": "Infinity1", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity2", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity3", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity4", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity5", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity6", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity7", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity8", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Infinity9", "count": 1 ,'classification': ItemClassification.progression},
{ "name": "Laboratory", "count": 1,'classification': ItemClassification.progression },
{ "name": "YellowSpawn2", "count": 1 ,'classification': ItemClassification.useful},
{ "name": "AutoCollect", "count": 8 ,'classification': ItemClassification.useful}
]

milestone_items: List[ItemDict] = [
    { "name": "Reds500", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues10", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds2k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues100", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds4k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues200", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds6k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues300", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds8k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues500", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds10k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues800", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Yellows5", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds15k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues1.2k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Yellows10", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds20k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues1.6k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Yellows15", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds30k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues2k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds50k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues4k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Reds100k", "count":1 ,"classification": ItemClassification.filler},
    { "name": "Blues8k", "count":1 ,"classification": ItemClassification.filler},
]

goal_items: List[ItemDict] = [
    { "name": "Virus Deployed", "count":1,"classification": ItemClassification.progression}
]