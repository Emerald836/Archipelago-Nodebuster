from typing import Dict, List

from BaseClasses import Location

base_id = 268000



class NodebusterLocation(Location):
    game: str = "Nodebuster"

upgrade_locations = [
    "Upgrade Node"
]


regions_to_locations: Dict[str, List[str]] = {
    "Menu": [],
    "Upgrades": upgrade_locations,
    "Epilogue": []
}
