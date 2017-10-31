# HumanTraits.rb
# Author:: Chase Hennion
#
# The HumanTraits module stores all of the pertinent data and scores for the Human race

module HumanTraits
 
  # Default Human Speed
  SPEED = 30
  
  # Default Human Darkvision Range
  DARKVISION_RANGE = 0 
       
  # Common Male Human Names
  COMMON_NAMES_MALE = [ "Aragorn", 
                        "Boromir", 
                        "Wulfgar", 
                        "Jon", 
                        "Robb" 
                      ]
                      
  # Common Female Human Names 
  COMMON_NAMES_FEMALE = [ "Lilia", 
                          "Cattie-Brie", 
                          "Arya", 
                          "Sansa", 
                          "Catelyn" 
                        ]
    
  # Human Immunities               
  IMMUNITIES = []
    
  # Human Weapon Familiarities
  WEAPON_FAMILIARITIES = []
      
  # Human Level Bonuses
  LEVEL_BONUSES = { "feat" => 0, 
                    "skill" => 1 
                  }
            
  # Human Initial Bonuses      
  STARTING_BONUSES = { "feat" => 1, 
                       "skill" => 0 
                     }  
    
  # Human Attack Bonuses vs. Monsters
  ATTACK_BONUSES = { }
    
  # Human Defense Bonuses  
  DEFENSE_BONUSES = { }  
    
end