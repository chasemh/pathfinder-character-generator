require_relative 'Character.rb'
require_relative '../Trait_Modules/ClericTraits.rb'
require_relative '../Trait_Modules/DwarfTraits.rb'
require_relative '../Trait_Modules/ElfTraits.rb'
require_relative '../Trait_Modules/HumanTraits.rb'

# Cleric.rb
# Author:: Chase Hennion
# 
# The Cleric class is a specialization of the Character class. Clerics are warrior priests
# that use combat and healing magic.

class Cleric < Character

    include ClericTraits
    
    # Create a new Cleric instance
    # * name  The cleric's name
    # * race  The cleric's race
    # * gender  The cleric's gender
    # * alignment  The cleric's alignment
    def initialize( name, race, gender, alignment )
      
      # Choose the trait module to include
      case race
      when "dwarf"
        self.class.send( :include, DwarfTraits )
      when "elf"
        self.class.send( :include, ElfTraits )
      else
        self.class.send( :include, HumanTraits )
      end
      
      # Compile equipment proficiencies
      equipProf = EQUIPMENT_PROFICIENCY + WEAPON_FAMILIARITIES
      equipProf.uniq!
      
      # Cleric Specific Data
      @spells = LEVEL_1_SPELLS
      @orisons = ORISONS
      
      className = "cleric"

      super( name, race, gender, alignment, className, FORTITUDE_SAVE, REFLEX_SAVE, WILL_SAVE, HP, ATTACK_BONUS, 
             SKILL_RANKS, SKILLS, SPEED, DARKVISION_RANGE, equipProf, IMMUNITIES, LEVEL_BONUSES, 
             STARTING_BONUSES, ATTACK_BONUSES, DEFENSE_BONUSES )
      
    end
    
    public
    
    # Assigns ability scores as dictated by a user
    # * str  The cleric's strength score
    # * dex  The cleric's dexterity score
    # * con  The cleric's constitution score
    # * int  The cleric's intelligent score
    # * wis  The cleric's wisdom score
    # * cha  The cleric's charisma score
    def customAssign( str, dex, con, int, wis, cha )
      
      # Include racial modifiers
      case @race
      when "dwarf"
        con += 2
        wis += 2
        cha -=2
      when "elf"
        dex += 2
        int += 2
        con -= 2
      else
        # Human: Put bonus in best class ability
        wis += 2
      end
      
      @strength = Ability.new( str )
      @dexterity = Ability.new( dex )
      @constitution = Ability.new( con )
      @intelligence = Ability.new( int )
      @wisdom = Ability.new( wis )
      @charisma = Ability.new( cha )
      
    end
    
    # Automatically assigns ability scores based on governing attributes of the Cleric class
    # * scores  Raw ability scores to assign
    def autoAssign( scores )
      #Given scores array, sort
      
      #dex, str, int, cha, con, wis
      # 0    1    2    3    4    5
      scores.sort!
      
      # Include racial modifiers
      case @race
      when "dwarf"
        # Bonuses to con, wis, detriment to cha
        scores[ 4 ] += 2
        scores[ 5 ] += 2
        scores[ 3 ] -= 2
      when "elf"
        # Bonuses to dex, int, detriment to con
        scores[ 0 ] += 2
        scores[ 2 ] += 2
        scores[ 4 ] -= 2  
      else
        # Human: Put bonus in best class ability
        scores[ 5 ] += 2
      end
      
    # Create Abilities
    @wisdom = Ability.new( scores[ 5 ] )
    @constitution = Ability.new( scores[ 4 ] )
    @charisma = Ability.new( scores[ 3 ] )
    @intelligence = Ability.new( scores[ 2 ] )
    @strength = Ability.new( scores[ 1 ] )
    @dexterity = Ability.new( scores[ 0 ] ) 
      
      
    end
    
    # Generates a formatted string containing the cleric's traits, abilities, and scores
    def to_s
      
      # Compile a string for the cleric's orisons
      orisons = "Orisons: \n"
      if @orisons.empty?
        orisons += "None \n"
      else
        @orisons.each do |orison|
          orisons += "#{orison.capitalize} \n"
        end
      end
      
      # Compile a string for the cleric's spells
      spells = "Level 1 Spells: \n"
      if @spells.empty?
        spells += "None \n"
      else
        @spells.each do |spell|
          spells += "#{spell.capitalize} \n"
        end
      end
      
     partialString = super
     
     fullString = "#{partialString}#{orisons}\n#{spells}"
     
     return fullString          
      
    end
      
  end