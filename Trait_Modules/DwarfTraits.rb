# DwarfTraits.rb
# Author:: Chase Hennion
#
# The DwarfTraits module stores all of the pertinent data and scores for the Dwarf race

module DwarfTraits
  
  # Default Dwarf Speed
  SPEED = 20
  
  # Default Dwarf Darkvision Range
  DARKVISION_RANGE = 60
  
  # Common Male Dwarf Names
  COMMON_NAMES_MALE = [ "Dolgrin", 
                        "Grunyar", 
                        "Harsk", 
                        "Kazmuk", 
                        "Morgrym", 
                        "Rogar", 
                        "Thorin" 
                      ] 
  
  # Common Female Dwarf Names
  COMMON_NAMES_FEMALE = [ "Agna", 
                          "Bodill", 
                          "Ingra", 
                          "Kotri", 
                          "Rusilka", 
                          "Yangrit" 
                        ]  
  # Dwarf Immunities
  IMMUNITIES = []  
  
  # Dwarf Weapon Familiarities
  WEAPON_FAMILIARITIES = [ "Battleaxe", 
                           "Warhammer" 
                         ]
  # Dwarf Level Bonuses
  LEVEL_BONUSES = { }
  
  # Dwarf Initial Bonuses    
  STARTING_BONUSES = { } 
  
  # Dwarf Attack Bonuses vs. Monsters    
  ATTACK_BONUSES = { "goblin" => 1, 
                     "orc" => 1 
                   }
  # Dwarf Defense Bonuses  
  DEFENSE_BONUSES = { "poison" => 2,
                      "spell" => 2 
                    }
                       
end