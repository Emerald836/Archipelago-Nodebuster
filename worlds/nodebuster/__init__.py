#from .Options import InscryptionOptions, Goal, EpitaphPiecesRandomization, PaintingChecksBalancing


from .Options import NodebusterOptions
from .items import upgrade_items, ItemDict, base_id, NodebusterItem, milestone_items, crypto_level_items, boss_drop_items, junk_items, progressive_items, progressive_items_exclude_list
from .locations import NodebusterLocation, regions_to_locations, get_locations, get_milestone_locations, get_boss_locations, get_crypto_locations
from .regions import every_region, nodebuster_regions_all, _add_milestone_regions, _add_boss_regions, _add_crypto_regions
#from .Items import act1_items, act2_items, act3_items, filler_items, base_id, InscryptionItem, ItemDict
#from .Locations import act1_locations, act2_locations, act3_locations, regions_to_locations
#from .Regions import inscryption_regions_all, inscryption_regions_act_1
from typing import Dict, Any
from . import rules
from .rules import set_all_rules
from BaseClasses import Region, Item, Tutorial, Entrance, EntranceType, ItemClassification
from worlds.AutoWorld import World, WebWorld


class NodebusterWeb(WebWorld):
    theme = "dirt"

    guide_en = Tutorial(
        "Multiworld Setup Guide",
        "A guide to setting up the Nodebuster Archipelago Multiworld",
        "English",
        "setup_en.md",
        "setup/en",
        ["Emerald"]
    )

    tutorials = [guide_en]

    bug_report_page = "https://github.com/Emerald836/Archipelago-Nodebuster/issues"


class NodebusterWorld(World):
    """
    Nodebuster is a short, experimental incremental game about busting nodes and destroying reality.
    """
    game = "Nodebuster"
    web = NodebusterWeb()
    options_dataclass = Options.NodebusterOptions
    options: Options.NodebusterOptions
    topology_present = True
    rule = rules
    all_items = upgrade_items + milestone_items + crypto_level_items + boss_drop_items + junk_items + progressive_items
    all_locations = get_locations() + get_milestone_locations() + get_crypto_locations() + get_boss_locations()
    item_name_to_id = {item["name"]: i + base_id for i, item in enumerate(all_items)}
    location_name_to_id = {location: i + base_id for i, location in enumerate(all_locations)}

    item_name_groups = {
    "Damage Increase": {"Damage1","DamagePerEnemy1","BossDamage1","Damage2","Damage3","Undamaged1","Execute1","Damage4","BossDamage2","CritDamage1","Damage5","Undamaged2","Execute2","RampingDamage1","CritDamage2","MaxHealthToDamage1"},
	"Attack Speed": {"AttackSpeed1","AttackSpeed2"},
	"Max Health Increase": {"Health1","Health2","Health3","Health4","Health5","Health6","Health7"},
	"Health Regen": {"HealthRegen1","Salvaging1","Lifesteal1","HealthRegen2","Salvaging2","DropHeal1","MaxHealthHeal1","Lifesteal2","Lifesteal3","StealMaxHealth1","MaxHealthHeal2","StealMaxHealth2","StealMaxHealth3"},
	"SpawnRate Increase": {"SpawnRate1","SpawnRate2","SpawnRate3","SpawnRate4","NodeFinder1","YellowSpawn1","YellowSpawn2"},
	"Armor Increase": {"Armor1","BossArmor1","Armor2","ArmorPerEnemy1","Armor3","Armor4","BossArmor2","Armor5","Armor6","MaxHealthToArmor1","Armor7","FocusArmor1","MaxHealthToArmor2","RampingArmor1"},
	"Infinity": {"Infinity1","Infinity2","Infinity3","Infinity4","Infinity5","Infinity6","Infinity7","Infinity8","Infinity9"},
	"Milestone Rewards": {"Reds500","Blues10","Reds2k","Blues100","Reds4k","Blues200","Reds6k","Blues300","Reds8k","Blues500","Reds10k","Blues800","Yellows5","Reds15k","Blues1.2k","Yellows10","Reds20k","Blues1.6k","Yellows15","Reds30k","Blues2k","Reds50k","Blues4k","Reds100k","Blues8k"}
    }

    def create_item(self, name: str) -> Item:
        item_id = self.item_name_to_id[name]
        item_data = self.all_items[item_id - base_id]
        return NodebusterItem(name, item_data["classification"], item_id, self.player)

    

    def create_regions(self) -> None:
        used_regions = every_region
        for region_name, exits in used_regions["regions"].items():
            r = Region(region_name, self.player,self.multiworld)
            for exit_name in exits:
                if not self.options.milestone:
                    if exit_name in used_regions["milestone_regions"]:
                        continue
                if not self.options.crypto:
                    if exit_name in used_regions["crypto_regions"]:
                        continue
                if self.options.bossdrops <= 0:
                    if exit_name in used_regions["boss_regions"]:
                        continue
                r.exits.append(Entrance(self.player, exit_name, r))
            self.multiworld.regions.append(r)

        if self.options.milestone:
            for region_name, exits in used_regions["milestone_regions"].items():
                r = Region(region_name, self.player,self.multiworld)
                for exit_name in exits:
                    if not self.options.crypto:
                        if exit_name in used_regions["crypto_regions"]:
                            continue
                    if self.options.bossdrops <= 0:
                        if exit_name in used_regions["boss_regions"]:
                            continue
                    r.exits.append(Entrance(self.player, exit_name, r, 0, EntranceType.TWO_WAY))
                self.multiworld.regions.append(r)


        if self.options.crypto:
            for region_name, exits in used_regions["crypto_regions"].items():
                r = Region(region_name, self.player, self.multiworld)
                for exit_name in exits:
                    if not self.options.milestone:
                        if exit_name in used_regions["milestone_regions"]:
                            continue
                    if self.options.bossdrops <= 0:
                        if exit_name in used_regions["boss_regions"]:
                            continue
                    r.exits.append(Entrance(self.player, exit_name, r, 0, EntranceType.TWO_WAY))
                self.multiworld.regions.append(r)



        if self.options.bossdrops > 0:
            for region_name, exits in used_regions["boss_regions"].items():
                r = Region(region_name, self.player, self.multiworld)
                for exit_name in exits:
                    if not self.options.milestone:
                        if exit_name in used_regions["milestone_regions"]:
                            continue
                    if not self.options.crypto:
                        if exit_name in used_regions["crypto_regions"]:
                            continue
                    r.exits.append(Entrance(self.player, exit_name, r, 0, EntranceType.TWO_WAY))
                self.multiworld.regions.append(r)



        for entr_name, region  in used_regions["mandatory_regions"].items():
            for region_name in region:
                if not self.options.milestone:
                    if region_name in used_regions["milestone_regions"]:
                        continue
                if not self.options.crypto:
                    if region_name in used_regions["crypto_regions"]:
                        continue
                if self.options.bossdrops <= 0:
                    if region_name in used_regions["boss_regions"]:
                        continue
                e = self.multiworld.get_entrance(entr_name, self.player)
                r = self.multiworld.get_region(region_name, self.player)
                e.connect(r)

      #  for entr_name, region in used_regions["regions"].items():
      #      if entr_name == "Menu": continue
      #      for region_name in region:
      #          if not self.options.milestone:
      #              if region_name in used_regions["milestone_regions"]:
      #                  continue
      #          if not self.options.crypto:
     #               if region_name in used_regions["crypto_regions"]:
     #                   continue
      #          if self.options.bossdrops <= 0:
     #               if region_name in used_regions["boss_regions"]:
       #                 continue
    #            e = self.multiworld.get_entrance(entr_name, self.player)
     #           r = self.multiworld.get_region(region_name, self.player)
       #         e.connect(r)

        for region_name, location in regions_to_locations.items():
            if used_regions.get(region_name,None) is None: continue
            region = self.multiworld.get_region(region_name, self.player)
            for loc_name in location:
                loc = NodebusterLocation(self.player, loc_name, self.location_name_to_id.get(loc_name, None), region)
                region.locations.append(loc)
        #for region_name, region_connections in used_regions.items():
        #    region = self.get_region(region_name)
         #   region.add_exits(region_connections)
         #   region.add_locations({
         #       location: self.location_name_to_id[location] for location in regions_to_locations[region_name]
         #   })
    
    def create_items(self) -> None:
        for item in self.all_items:
            if not self.options.milestone:
                if item in milestone_items:
                    continue
                if item["name"] == "Progressive Milestone Reward":
                    continue
            if not self.options.crypto:
                if item in crypto_level_items:
                    continue
            if not self.options.progressiveItems:
                if item in progressive_items:
                    continue
            else:
                if item["name"] in progressive_items_exclude_list:
                    continue
            match self.options.bossdrops:
                case 0:
                    if item in boss_drop_items:
                        continue
                case 1:
                    if item["name"] == "Boss Drop":
                        item["count"] = 18
                    elif item["name"] == "Extra Bits":
                        item["count"] = 4
                    elif item["name"] == "Extra Nodes":
                        item["count"] = 4
                case 2:
                    if item["name"] == "Boss Drop":
                        item["count"] = 26
                    elif item["name"] == "Extra Bits":
                        item["count"] = 0
                        continue
                    elif item["name"] == "Extra Nodes":
                        item["count"] = 0
                        continue

            for _ in range(item["count"]):
                new_item = self.create_item(item["name"])
                self.multiworld.itempool.append(new_item)
        
        #junk = len(self.all_locations) - len(self.all_items)
        #self.multiworld.itempool += [self.create_item("Nothing") for _ in range(junk)]

    set_rules = rules.set_rules


   # def set_rules(self) -> None:
        #rules
        #rules.NodebusterRules(self).set_all_rules()



    def fill_slot_data(self) -> Dict[str, Any]:
        return self.options.as_dict(
            "death_link",
            "goal",
            "milestone",
            "crypto",
            "bossdrops"
        )
