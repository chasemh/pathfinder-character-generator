# FighterTraits.rb
# Author:: Chase Hennion
#
# The FighterTraits module stores all of the pertinent data and scores for the Fighter class

module FighterTraits
  
  # Fighter's Fortitude Saving Throw Value
  FORTITUDE_SAVE = 2 
  
  # Fighter's Reflex Saving Throw Value
  REFLEX_SAVE = 0
  
  # Fighter's Will Saving Throw Value
  WILL_SAVE = 2
  
  # Fighter's Hitpoints Value
  HP = 10
  
  # Fighter's Attack Bonus Modifier
  ATTACK_BONUS = 1
  
  # Fighter's skill ranks
  SKILL_RANKS = 2
  
  # Fighter Skills
  SKILLS = [ "climb", 
             "knowledge dungeoneering", 
             "ride", 
             "swim" 
           ]
  
  # Fighter Equipment Proficiencies            
  EQUIPMENT_PROFICIENCY = [ "shields", 
                            "light armor", 
                            "medium armor", 
                            "heavy armor", 
                            "simple weapons",
                            "martial weapons"
                          ] 
  
  # Initial Fighter talents                                                
  LEVEL_1_TALENTS = [ "weapon focus - +1 attack" ]
                  
end