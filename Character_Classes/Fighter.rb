require_relative 'Character.rb'
require_relative '../trait_modules/FighterTraits.rb'
require_relative '../trait_modules/DwarfTraits.rb'
require_relative '../trait_modules/ElfTraits.rb'
require_relative '../trait_modules/HumanTraits.rb'

# Fighter.rb
# Author:: Chase Hennion
#
# The Fighter class is a specialization of the Character class. Fighters specialize in all
# forms of martial combat. They are strong and durable.

class Fighter < Character

    include FighterTraits

    # Creates a new Fighter instance
    # * name  The fighter's name
    # * race  The fighter's race
    # * gender  The fighter's gender
    # * alignment  The fighter's alignment
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

      # Fighter Specific Data
      className = "fighter"
      @talents = LEVEL_1_TALENTS

      super( name, race, gender, alignment, className, FORTITUDE_SAVE, REFLEX_SAVE, WILL_SAVE, HP, ATTACK_BONUS,
             SKILL_RANKS, SKILLS, SPEED, DARKVISION_RANGE, equipProf, IMMUNITIES, LEVEL_BONUSES,
             STARTING_BONUSES, ATTACK_BONUSES, DEFENSE_BONUSES )

    end

  # Assigns ability scores as dictated by a user
      # * str  The fighter's strength score
      # * dex  The fighter's dexterity score
      # * con  The fighter's constitution score
      # * int  The fighter's intelligent score
      # * wis  The fighter's wisdom score
      # * cha  The fighter's charisma score
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
        # Human
        str += 2
      end

      @strength = Ability.new( str )
      @dexterity = Ability.new( dex )
      @constitution = Ability.new( con )
      @intelligence = Ability.new( int )
      @wisdom = Ability.new( wis )
      @charisma = Ability.new( cha )

    end

    # Automatically assigns ability scores based on governing attributes of the Fighter class
    # * scores  Raw ability scores to assign
    def autoAssign( scores )
      # Given scores array, sort
      # str, con, dex, int, wis, cha
      # cha, wis, int, dex, con, str
      #  0    1    2    3    4    5
      scores.sort!

      # Include racial modifiers
      case @race
      when "dwarf"
        # Bonuses to con, wis, detriment to cha
        scores[ 4 ] += 2
        scores[ 1 ] += 2
        scores[ 0 ] -= 2
      when "elf"
        # Bonuses to dex, int, detriment to con
        scores[ 3 ] += 2
        scores[ 2 ] += 2
        scores[ 4 ] -= 2
      else
        # Human: Put bonus in best class ability
        scores[ 5 ] += 2
      end

    # Create Abilities
    @strength = Ability.new( scores[ 5 ] )
    @constitution = Ability.new( scores[ 4 ] )
    @dexterity = Ability.new( scores[ 3 ] )
    @intelligence = Ability.new( scores[ 2 ] )
    @wisdom = Ability.new( scores[ 1 ] )
    @charisma = Ability.new( scores[5] )

   end

   # Generates a formatted string containing the fighter's traits, abilities, and scores
   def to_s

     # Compile a string for the fighter's talents
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
