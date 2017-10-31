require_relative 'Character.rb'
require_relative '../Trait_Modules/WizardTraits.rb'
require_relative '../Trait_Modules/DwarfTraits.rb'
require_relative '../Trait_Modules/ElfTraits.rb'
require_relative '../Trait_Modules/HumanTraits.rb'

# Wizard.rb
# Author:: Chase Hennion
# 
# The Wizard class is a specialization of the Character class. Wizards are magic specialists.
# Though they are physically weak, they can attack enemies with a variety of powerful magic.

class Wizard < Character

    include WizardTraits
    
    # Create a new Wizard instance
    # * name  The wizard's name
    # * race  The wizard's race
    # * gender  The wizard's gender
    # * alignment  The wizard's alignment
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
      
      # Wizard Specific Data
      @spells = LEVEL_1_SPELLS
      @cantrips = CANTRIPS
      
      className = "wizard"

      super( name, race, gender, alignment, className, FORTITUDE_SAVE, REFLEX_SAVE, WILL_SAVE, HP, ATTACK_BONUS, 
             SKILL_RANKS, SKILLS, SPEED, DARKVISION_RANGE, equipProf, IMMUNITIES, LEVEL_BONUSES, 
             STARTING_BONUSES, ATTACK_BONUSES, DEFENSE_BONUSES )
      
    end
    
    # Assigns ability scores as dictated by a user
    # * str  The wizard's strength score
    # * dex  The wizard's dexterity score
    # * con  The wizard's constitution score
    # * int  The wizard's intelligent score
    # * wis  The wizard's wisdom score
    # * cha  The wizard's charisma score
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
        int += 2
      end
      
      @strength = Ability.new( str )
      @dexterity = Ability.new( dex )
      @constitution = Ability.new( con )
      @intelligence = Ability.new( int )
      @wisdom = Ability.new( wis )
      @charisma = Ability.new( cha )
      
    end
    
    # Automatically assigns ability scores based on governing attributes of the Wizard class
    # * scores  Raw ability scores to assign
    def autoAssign( scores )
      #Given scores array, sort
      #str, cha, wis, dex, con, int
      # 0    1    2    3    4    5
      
      scores.sort!
      
      # Include racial modifiers
      case @race
      when "dwarf"
        # Bonuses to con, wis, detriment to cha
        scores[ 4 ] += 2
        scores[ 2 ] += 2
        scores[ 1 ] -= 2
      when "elf"
        # Bonuses to dex, int, detriment to con
        scores[ 3 ] += 2
        scores[ 5 ] += 2
        scores[ 4 ] -= 2  
      else
        # Human: Put bonus in best class ability
        scores[ 5 ] += 2
      end
      
    # Create Abilities
    @intelligence = Ability.new( scores[ 5 ] )
    @constitution = Ability.new( scores[ 4 ] )
    @dexterity = Ability.new( scores[ 3 ] )
    @wisdom = Ability.new( scores[ 2 ] )
    @charisma = Ability.new( scores[ 1 ] )
    @strength = Ability.new( scores[ 0 ] ) 
      
    end
    
    # Generates a formatted string containing the cleric's traits, abilities, and scores
    def to_s
      
      # Compile a string for the wizard's cantrips
      cantrips = "Cantrips: \n"
      if @cantrips.empty?
        cantrips += "None \n"
      else
        @cantrips.each do |cantrip|
          cantrips += "#{cantrip.capitalize} \n"
        end
      end
      
      # Compile a string for the wizard's spells
      spells = "Level 1 Spells: \n"
      if @spells.empty?
        spells += "None \n"
      else
        @spells.each do |spell|
          spells += "#{spell.capitalize} \n"
        end
      end
      
     partialString = super
     
     fullString = "#{partialString}#{cantrips}\n#{spells}"
     
     return fullString          
      
    end
        
end