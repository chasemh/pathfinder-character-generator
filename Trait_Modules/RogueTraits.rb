# RogueTraits.rb
# Author:: Chase Hennion
#
# The RogueTraits module stores all of the pertinent data and scores for the Rogue class

module RogueTraits
  
  # Rogue's Fortitude Saving Throw Value
  FORTITUDE_SAVE = 0
  
  # Rogue's Reflex Saving Throw Value
  REFLEX_SAVE = 2
  
  # Rogue's Will Saving Throw Value
  WILL_SAVE = 0
  
  # Rogue's Hitpoints Value
  HP = 8
  
  # Rogue's Attack Bonus Modifier
  ATTACK_BONUS = 0
  
  # Rogue's skill ranks
  SKILL_RANKS = 8
  
  # Rogue Skills
  SKILLS = [ "acrobatics",
             "bluff",
             "climb",
             "diplomacy",
             "disable device",
             "knowledge dungeoneering",
             "knowledge local",
             "perception",
             "sense motive",
             "stealth",
             "swim"  
           ]
  
  # Rogue Equipment Proficiencies         
  EQUIPMENT_PROFICIENCY = [ "light armor",
                             "simple weapons",
                             "rapier",
                             "shortbow",
                             "short sword"
                           ]
                           
  # Initial Rogue talents                          
  LEVEL_1_TALENTS = [ "sneak attack + 1d6",
                      "trapfinding + 1",
                    ]         
end