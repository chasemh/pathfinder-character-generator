# WizardTraits.rb
# Author:: Chase Hennion
#
# The WizardTraits module stores all of the pertinent data and scores for the Wizard class

module WizardTraits
  
  # Wizard's Fortitude Saving Throw Value
  FORTITUDE_SAVE = 0
  
  # Wizard's Reflex Saving Throw Value
  REFLEX_SAVE = 0
  
  # Wizard's Will Saving Throw Value
  WILL_SAVE = 2
  
  # Wizard's Hitpoints Value
  HP = 6
  
  # Wizard's Attack Bonus Modifier
  ATTACK_BONUS = 0
  
  # Wizard's skill ranks
  SKILL_RANKS = 2
  
  # Wizard Skills
  SKILLS = [ "knowledge arcana",
             "knowledge dungeoneering",
             "knowledge geography",
             "knowledge history",
             "knowledge local",
             "knowledge nature",
             "knowledge religion",
             "spellcraft"
           ]
      
  # Wizard Equipment Proficiencies        
  EQUIPMENT_PROFICIENCY = [ "club",
                             "dagger",
                             "heavy crossbow",
                             "light crossbow",
                             "quarterstaff"
                           ]
           
  # Wizard's starting cantrips (unlimited magic spells)                                 
  CANTRIPS = [ "detect magic", 
               "ray of frost", 
               "mage hand", 
               "read magic" 
             ]
             
  # Wizard's starting spells (limited magic spells)    
  LEVEL_1_SPELLS = [ "alarm",
                     "feather fall",
                     "burning hands",
                     "mage armor",
                     "cause fear",
                     "magic missle",
                     "charm person",
                     "sleep",
                     "detect secret doors",
                     "disguise self"
                   ]
  
end