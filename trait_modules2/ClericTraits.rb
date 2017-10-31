# ClericTraits.rb
# Author:: Chase Hennion
#
# The ClericTraits module stores all of the pertinent data and scores for the Cleric class

module ClericTraits
  
  # Cleric's Fortitude Saving Throw Value
  FORTITUDE_SAVE = 2
  
  # Cleric's Reflex Saving Throw Value
  REFLEX_SAVE = 0
  
  # Cleric's Will Saving Throw Value
  WILL_SAVE = 2
  
  # Cleric's Hitpoints Value
  HP = 8
  
  # Cleric's Attack Bonus Modifier
  ATTACK_BONUS = 0
  
  # Cleric's skill ranks
  SKILL_RANKS = 2
  
  # Cleric Skills
  SKILLS = [ "diplomacy", 
             "heal", 
             "knowledge arcana", 
             "knowledge history", 
             "knowledge history", 
             "knowledge religion",
             "sense motive",
             "spellcraft"
           ]
  
  # Cleric Equipment Proficiencies                  
  EQUIPMENT_PROFICIENCY = [ "shields",
                            "light armor",
                            "medium armor",
                            "simple weapons"
                          ]
  # Cleric's starting orisons (unlimited magic spells)                         
  ORISONS = [ "detect magic",
              "read magic",
              "light",
              "stabilize"
            ]
  
  # Cleric's starting spells (limited magic spells)
  LEVEL_1_SPELLS = [ "bless",
                     "cause fear",
                     "cure light wounds",
                     "detect evil",
                     "doom",
                     "divine favor",
                     "protection from evil",
                     "remove fear",
                     "sanctuary",
                     "shield of faith"
                   ]
           
end