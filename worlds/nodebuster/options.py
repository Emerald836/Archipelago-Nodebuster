from dataclasses import dataclass

from Options import Toggle, Choice, DeathLinkMixin, StartInventoryPool, PerGameCommonOptions, DefaultOnToggle



class Goal(Choice):
    """Defines the goal to accomplish in order to complete the randomizer.

    - release virus
    
    - complete all milestones"""
    display_name = "Goal"
    option_release_virus = 0
    option_complete_all_milestones = 1
    default = 0


class CryptoMine(Choice):
    """Adds the crypto mine levels as a part of the item pool"""
    display_name = "Crypto Mine"
    option_crypto_unlock = 0
    option_crypto_levels = 1
    default = 0



@dataclass
class NodebusterOptions(DeathLinkMixin, PerGameCommonOptions):
    goal: Goal
    crypto: CryptoMine