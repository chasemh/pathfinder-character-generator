#!/usr/bin/env ruby

require_relative '../Text_Modules/HelpText.rb'
require_relative '../Text_Modules/InstructionText.rb'
require_relative '../Text_Modules/Selections.rb'
require_relative '../Classes/DiceRoller.rb'
require_relative '../Character_Classes/Cleric.rb'
require_relative '../Character_Classes/Fighter.rb'
require_relative '../Character_Classes/Rogue.rb'
require_relative '../Character_Classes/Wizard.rb'
require_relative '../Trait_Modules/DwarfTraits.rb'
require_relative '../Trait_Modules/ElfTraits.rb'
require_relative '../Trait_Modules/HumanTraits.rb'

# Driver.rb
# Author:: Chase Hennion
# 
# This script allows a user to generate a character for use with the Pathfinder RPG.
# It allows both manual and automatic character generation according to Pathfinder rules
# and stores the generated character in a file of the user's choice.

include InstructionText

# Writes a generated character to file
# * character  The character to write to file
# * creationStep  The current character creation step. Used for finding help text.
# * error  An error lambda for error reporting
def writeToFile( character, creationStep, error )
  
  #Get the working directory, append character directory
  charDir = Dir.pwd + "/Generated_Characters/"
  
  #Get filename from user
  fileName = acceptInput( INSTRUCTION[ creationStep ], creationStep, "all", error )
  
  #Create the full path
  filePath = charDir + fileName
  
  #Open and write to file. Block automatically closes file.
  open( filePath, 'w' ) do |file|
    file.puts character.to_s
  end
  
  puts "Generated character written to file '#{filePath}'"
  
end

# Method for handling automatic generation of a character
# * className  The character's class
# * gender The character's gender
# * creationStep  The current creation step. Used for finding help text.
# * error  An error lambda for error reporting
def autoGen( className, gender, creationStep, error )

  numAbilities = 6
  
  #Step 4: Alignment
  #Randomly generate alignment
  alignment = Selections::ALIGNMENTS.sample
  creationStep += 1
  
  #Step 5: Race
  #Randomly generate race
  race = Selections::RACES.sample
  creationStep += 1
  
  #Step 6: Abilities
  #Randomly generate ability scores
  #Roll 4D6
  diceSides = 6
  numDice = 4
  dice = DiceRoller.new( numDice, diceSides )
  scores = []
    
  numAbilities.times do 
    scores.push( dice.abilityRoll )
  end
  
  creationStep += 1
    
  # Step 7: Name
  # Choose random name
  name = ""
  case race
  when "dwarf"
    if gender == "male"
      name = DwarfTraits::COMMON_NAMES_MALE.sample
    else
      name = DwarfTraits::COMMON_NAMES_FEMALE.sample
    end
  when "elf"
    if gender == "male"
      name = ElfTraits::COMMON_NAMES_MALE.sample
    else
      name = ElfTraits::COMMON_NAMES_FEMALE.sample
    end
  else
    # Human
    if gender == "male"
      name = HumanTraits::COMMON_NAMES_MALE.sample
    else
      name = HumanTraits::COMMON_NAMES_FEMALE.sample
    end
  end
  creationStep += 1
  
  # Create character
  character = nil
  case className
  when "cleric"
    character = Cleric.new( name , race , gender , alignment )
  when "fighter"
    character = Fighter.new( name , race , gender , alignment )
  when "rogue"
    character = Rogue.new( name , race , gender , alignment )
  else
    # Wizard
    character = Wizard.new( name , race , gender , alignment )
  end
  
  # Set Abilities
  character.autoAssign( scores )
  
  # Step 8: Write To File
  writeToFile( character, creationStep, error )
  
  puts "Character Creation Complete!"
 
end

# Method for handling manual generation of a character
# * className  The character's class
# * gender The character's gender
# * creationStep  The current creation step. Used for finding help text.
# * error  An error lambda for error reporting
def manGen( className, gender, creationStep, error )
  
  numAbilities = 6
  
  # Step 4: Alignment
  alignment = acceptInput( INSTRUCTION[ creationStep ], creationStep, Selections::ALIGNMENTS, error )
  creationStep += 1
  
  # Step 5: Race
  race = acceptInput( INSTRUCTION[ creationStep ], creationStep, Selections::RACES, error )
  creationStep += 1
  
  # Step 6: Abilities
  # Randomly generate ability scores
  diceSides = 6
  numDice = 4
  dice = DiceRoller.new( numDice, diceSides )
  scores = []
    
  numAbilities.times do 
    scores.push( dice.abilityRoll )
  end
  
  # Manual assignment of abilities
  numerical = true
  
  rawAbilInstruct = INSTRUCTION[ creationStep ]
  
  strInstruct = "#{scoreText( scores ) } \n#{rawAbilInstruct} strength: "
  str = acceptInput( strInstruct, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( str ) )
  
  dexInstruc = "#{scoreText( scores ) } \n#{rawAbilInstruct} dexterity: "
  dex = acceptInput( dexInstruc, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( dex ) )
  
  conInstruct = "#{scoreText( scores ) } \n#{rawAbilInstruct} constitution: "
  con = acceptInput( conInstruct, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( con ) )
  
  intInstruct = "#{scoreText( scores ) } \n#{rawAbilInstruct} intelligence: "
  int = acceptInput( intInstruct, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( int ) )
  
  wisInstruc = "#{scoreText( scores ) } \n#{rawAbilInstruct} wisdom: "
  wis = acceptInput( wisInstruc, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( wis ) )
  
  chaInstruct = "#{scoreText( scores ) } \n#{rawAbilInstruct} charisma: "
  cha = acceptInput( chaInstruct, creationStep, scores, error, numerical )
  scores.delete_at( scores.index( cha ) )
  
  creationStep += 1
  
  # Step 7: Name
  name = acceptInput( INSTRUCTION[ creationStep ], creationStep, "all", error )
  creationStep += 1
  
  # Create character
  character = nil
  case className
  when "cleric"
    character = Cleric.new( name , race , gender , alignment )
  when "fighter"
    character = Fighter.new( name , race , gender , alignment )
  when "rogue"
    character = Rogue.new( name , race , gender , alignment )
  else
    # Wizard
    character = Wizard.new( name , race , gender , alignment )
  end
    
  # Set Abilities
  character.customAssign( str, dex, con, int, wis, cha )
  
  # Step 8: Write to File
  writeToFile( character, creationStep, error )
  
  puts "Character Creation Complete!"
  
end

# Method for accepting user input from the console
# * instruction  The instruction prompt that informs the user about what information is requested
# * creationStep  The current creation step. Used for finding help text.
# * acceptableValues  The acceptable values for the input being requested from the user.
# * error  An error lambda for error reporting
# * numerical  Set to true if requesting integer data from the user. False otherwise.
def acceptInput( instruction, creationStep, acceptableValues, error, numerical = false )
  goodInput = false
  input = ""
  
  while goodInput == false
    puts instruction
    if numerical == false
      # String-based input
      input = gets.chomp.downcase
    else
      # Integer-based input
      input = gets.chomp.to_i  
    end
    
    # Accept any input unless received explicit selectable values
    return input unless acceptableValues != "all" || input == "help"
    
    if acceptableValues.include?( input )
      return input
    elsif input == "help" || input == "help".to_i
       puts HelpText::HELP[ creationStep ]
    else
      error.call( input )
    end
    
  end
  
end

# Program Start
#==================================================================================

puts "================================================="
puts "Pathfinder RPG Character Generator - Version 1.1"
puts "Author: Chase Hennion"
puts "5 / 30 / 2013"
puts "=================================================\n\n"

# Variable setup
genMode = ""
charClass = ""
gender = ""
creationStep = 1
  
error = lambda { |input| puts "Entry '#{input}' unrecognized. Please try again. Type 'help' if you need assistance." }  

# Introduction
puts "Welcome. This program will allow you to generate a character for use in the Pathfinder RPG."
puts "If you need help or clarification about any step, type 'help' for assistance.\n\n"

# Step 1: Character Generation Mode
genMode = acceptInput( INSTRUCTION[ creationStep ], creationStep, Selections::MODES, error  )
creationStep += 1

# Step 2: Class Selection
charClass = acceptInput( INSTRUCTION[ creationStep ], creationStep, Selections::CLASSES, error )
creationStep += 1

# Step 3: Gender Selection
gender = acceptInput( INSTRUCTION[ creationStep ], creationStep, Selections::GENDERS, error )
creationStep += 1

# Now to split into manual and automatic generation
if genMode == "manual"
  manGen( charClass, gender, creationStep, error )
else
  autoGen( charClass, gender, creationStep, error )
end


