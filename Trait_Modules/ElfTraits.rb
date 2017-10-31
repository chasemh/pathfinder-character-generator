# ElfTraits.rb
# Author:: Chase Hennion
#
# The ElfTraits module stores all of the pertinent data and scores for the Elf race

module ElfTraits
  
  # Default Elf Speed
  SPEED = 30
  
  # Default Elf Darkvision Range
  DARKVISION_RANGE = 120
  
  # Common Male Elf Names
  COMMON_NAMES_MALE = [ "Legolas", 
                        "Caladrel", 
                        "Heldalel", 
                        "Lanliss", 
                        "Meirdrarel", 
                        "Seldlon", 
                        "Talathel", 
                        "Variel", 
                        "Zordion" 
                      ]
  
  # Common Female Elf Names  
  COMMON_NAMES_FEMALE = [ "Arwen", 
                          "Amrunelara", 
                          "Dardlara", 
                          "Faunra", 
                          "Jathal", 
                          "Merisel", 
                          "Oparal", 
                          "Soumral", 
                          "Tessara", 
                          "Yalandlara" 
                        ] 
                          
  # Elf Immunities
  IMMUNITIES = [ "sleep" ]
    
  # Elf Weapon Familiarities
  WEAPON_FAMILIARITIES = [ "Longbow", 
                           "Longsword", 
                           "Rapier", 
                           "Shortbow" 
                         ]
  # Elf Level Bonuses
  LEVEL_BONUSES = { "feat" => 0, 
                    "skill" => 0 
                  }
                  
  # Elf Initial Bonuses
  STARTING_BONUSES = { "feat" => 0, 
                       "skill" => 0 
                     } 
                     
  # Elf Attack Bonuses vs. Monsters    
  ATTACK_BONUSES = { }
    
  # Elf Defense Bonuses  
  DEFENSE_BONUSES = { }  
    
end