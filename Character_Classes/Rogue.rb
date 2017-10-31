require_relative 'Character.rb'
require_relative '../Trait_Modules/RogueTraits.rb'
require_relative '../Trait_Modules/DwarfTraits.rb'
require_relative '../Trait_Modules/ElfTraits.rb'
require_relative '../Trait_Modules/HumanTraits.rb'

# Rogue.rb
# Author:: Chase Hennion
# 
# The Rogue class is a specialization of the Character class. Rogues are stealthy thieves and 
# assassins. They are generally weaker than fighters and thus specialize in ranged weapons and 
# hit-and-run tactics.

class Rogue < Character

    include RogueTraits
    
      # Create a new Rogue instance
      # * name  The rogue's name
      # * race  The rogue's race
      # * gender  The rogue's gender
      # * alignment  The rogue's alignment
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
      
      # Rogue Specific Data
      @talents = LEVEL_1_TALENTS
      
      className = "rogue"

      super( name, race, gender, alignment, className, FORTITUDE_SAVE, REFLEX_SAVE, WILL_SAVE, HP, ATTACK_BONUS, 
             SKILL_RANKS, SKILLS, SPEED, DARKVISION_RANGE, equipProf, IMMUNITIES, LEVEL_BONUSES, 
             STARTING_BONUSES, ATTACK_BONUSES, DEFENSE_BONUSES )
    end
    
      # Assigns ability scores as dictated by a user
      # * str  The rogues's strength score
      # * dex  The rogues's dexterity score
      # * con  The rogues's constitution score
      # * int  The rogues's intelligent score
      # * wis  The rogues's wisdom score
      # * cha  The rogues's charisma score
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
        dex += 2
      end
      
      @strength = Ability.new( str )
      @dexterity = Ability.new( dex )
      @constitution = Ability.new( con )
      @intelligence = Ability.new( int )
      @wisdom = Ability.new( wis )
      @charisma = Ability.new( cha )
      
    end
    
    # Automatically assigns ability scores based on governing attributes of the Rogue class
    # * scores  Raw ability scores to assign
    def autoAssign( scores )
      #Given scores array, sort
      #wis, int, cha, str, con, dex
      # 0    1    2    3    4    5
      scores.sort!
      
      #Include racial modifiers
      case @race
      when "dwarf"
        #Bonuses to con, wis, detriment to cha
        scores[ 4 ] += 2
        scores[ 0 ] += 2
        scores[ 2 ] -= 2
      when "elf"
        #Bonuses to dex, int, detriment to con
        scores[ 5 ] += 2
        scores[ 1 ] += 2
        scores[ 4 ] -= 2
      else
        #Human: Put bonus in best class ability
        scores[ 5 ] += 2
      end
      
    #Create Abilities
    @dexterity = Ability.new( scores[ 5 ] )
    @constitution = Ability.new( scores[ 4 ] )
    @strength = Ability.new( scores[ 3 ] )
    @charisma = Ability.new( scores[ 2 ] )
    @intelligence = Ability.new( scores[ 1 ] )
    @wisdom = Ability.new( scores[ 0 ] ) 
      
    end
    
    # Generates a formatted string containing the cleric's traits, abilities, and scores
    def to_s
        talents = "Level 1 Talents: \n"
        if @talents.empty?
          orisons += "None \n"
        else
          @talents.each do |talent|
            talents += "#{talent.capitalize} \n"
          end
        end
        
     partialString = super
     
     fullString = "#{partialString}#{talents}"
     
     return fullString          
  
    end
end    