# InstructionText.rb
# Author:: Chase Hennion
# 
# The InstructionText module stores instructional text for each step in the character creation process.

module InstructionText
  
  # Character Generation Mode Instruction
  GEN_SCHEME = "Please select a character generation scheme: Manual, Automatic"
   
  # Name Entry Instruction
  NAME = "Enter a name for your character: "
  
  # Gender Entry Instruction
  GENDER = "Please choose a gender for your character: Male, Female"
  
  # Race Entry Instruction
  RACE = "Pick a race for your character: Dwarf, Elf, Human"
  
  # Class Entry Instruction
  CLASS = "Pick a class for your character: Cleric, Fighter, Rogue, Wizard"
  
  # Alignment Entry Instruction
  ALIGNMENT = "Please choose an alignment for your character: Lawful Good, Neutral Good, \n" +
              "Chaotic Good, Lawful Neutral, Neutral, Chaotic Neutral"
  
  # Write to file instruction
  TO_FILE = "Character creation is complete! Your character will now be saved to file. \n" +
            "Please enter the name for this file: "
  
  # Raw Ability Text
  ABILITY = "Please enter an ability score for "
  
  # Instruction Lookup Hash
  INSTRUCTION = { 1 => GEN_SCHEME ,
                  2 => CLASS ,
                  3 => GENDER ,
                  4 => ALIGNMENT ,
                  5 => RACE ,
                  6 => ABILITY,
                  7 => NAME ,
                  8 => TO_FILE 
                } 
  
  # Generates a string containing a list of available ability scores
  # scores  The available scores to include in the string
  def scoreText( scores )
    text = "Available scores: "
    scores.each do |val|
      text += " #{val.to_s} "
    end
    return text
  end
  
end