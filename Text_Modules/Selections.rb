# Selections.rb
# Author:: Chase Hennion
#
# The Selections module stores the valid possible user inputs for the character generation
# steps that have limited choices.

module Selections
  
  # Acceptable Character Generation Modes
  MODES = [ "manual", 
            "automatic" 
          ]
  # Acceptable Character Races   
  RACES = [ "dwarf", 
            "elf", 
            "human" 
          ]
  # Acceptable Character Classes   
  CLASSES = [ "cleric", 
              "fighter", 
              "rogue", 
              "wizard" 
            ]
  
  # Acceptable Character Genders            
  GENDERS = [ "male", 
              "female" 
            ]
  
  # Acceptable Character Alignments            
  ALIGNMENTS = [ "lawful good", 
                 "neutral good", 
                 "chaotic good", 
                 "lawful neutral", 
                 "neutral", 
                 "chaotic neutral" 
               ]
        
  # Acceptable Character Abililities                    
  ABILITIES = [ "strength", 
                "dexterity" ,
                "constitution" ,
                "intelligence" ,
                "wisdom",
                "charisma"
              ]  
end