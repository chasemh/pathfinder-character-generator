require_relative '../Classes/Ability.rb'

# Character.rb
# Author:: Chase Hennion
# 
# The Character class is responsible for maintaining all of the traits and abilities of a
# generated characters. The Character class is not instantiated directly, rather its ancestors are
# ( Cleric, Fighter, Rogue, Wizard ) are instantiated.

class Character
  
  attr_reader :strength
  attr_reader :dexterity
  attr_reader :constitution
  attr_reader :intelligence
  attr_reader :wisdom
  attr_reader :charisma
  
  # Creates a new Character instance
  # * name  The character's name
  # * race  The character's race
  # * gender  The character's gender
  # * alignment  The character's alignment
  # * className  The name of the character's class
  # * fortSave   The character's fortitude save value
  # * reflexSave  The character's reflex save value
  # * willSave  The character's will save value
  # * hp  The character's hitpoints
  # * atkBonus  The character's attack bonus modifier
  # * skillRanks  The number of skill ranks the character has
  # * skills  The character's skills
  # * speed  The character's speed
  # * darkvisionRange  The character's dark vision range
  # * equipProf  The character's equipment proficiencies
  # * immunities  The character's immunities
  # * levelBonuses  The character's bonuses gained for each level
  # * startBonuses  The character's initial bonuses
  # * atkBonuses  The character's attack bonuses against certain monsters
  # * defBonuses  The character's defense bonuses against certain entities
  def initialize( name, race, gender, alignment, className, fortSave, reflexSave, willSave,
                  hp, atkBonus, skillRanks, skills, speed, darkvisionRange, equipProf, 
                  immunities, levelBonuses, startBonuses, atkBonuses, defBonuses )
    @name = name
    @race = race
    @gender = gender
    @alignment = alignment
    @className = className
    @fortitudeSave = fortSave
    @reflexSave = reflexSave
    @willSave = willSave
    @hp = hp
    @attackBonus = atkBonus
    @skillRanks = skillRanks
    @skills = skills
    @speed = speed
    @darkvisionRange = darkvisionRange
    @equipmentProficiencies = equipProf
    @immunities = immunities
    @levelBonuses = levelBonuses
    @startingBonuses = startBonuses
    @attackBonuses = atkBonuses
    @defenseBonuses = defBonuses
  end
  
  public 
  
  # Generates a formatted string containing the character's traits, abilities, and scores
  def to_s
    
    #Compile string for starting bonuses
    startBon = "Starting Bonuses: \n"
    if @startingBonuses.empty?
      startBon += "None \n"
    else
      @startingBonuses.each do |name, value|
        startBon += "Initial +#{value} bonus to #{name} \n"
      end
    end
    
    #Compile a string for level bonuses
    levBon = "Level Bonuses: \n"
    if @levelBonuses.empty?
      levBon += "None \n"
    else
      @levelBonuses.each do |name, value|
              levBon += "+#{value} #{name} per level \n"
      end
    end
    
    #Compile a string for abilities, scores, and modifiers
    abil = "Ability       Score       Modifier \n" +
           "Strength       #{@strength.ptScore}            #{@strength.modifier} \n" +
           "Dexterity      #{@dexterity.ptScore}            #{@dexterity.modifier} \n" +
           "Constitution   #{@constitution.ptScore}            #{@constitution.modifier} \n" +
           "Intelligence   #{@intelligence.ptScore}            #{@intelligence.modifier} \n" +
           "Wisdom         #{@wisdom.ptScore}            #{@wisdom.modifier} \n" +
           "Charisma       #{@charisma.ptScore}            #{@charisma.modifier} \n"
           
    #Compile a string for saving throws       
    savThrows = "Saving Throws: \nFortitude Save: #{@fortitudeSave} \nReflex Save: #{@reflexSave} \n" +
                "Will Save: #{@willSave} \n"
    
    #Compile a string for immunities
    immunities = "Immunities: \n"
    if @immunities.empty?
      immunities += "None \n"
    else
      @immunities.each do |val|
        immunities += "#{val.capitalize} \n"
      end
    end 
    
    #Compile a string for attack bonuses vs monsters
    bonVsMonster = "Attack Bonuses vs. Monsters: \n"
    if @attackBonuses.empty?
      bonVsMonster += "None \n"
    else
      @attackBonuses.each do |creature, bonus|
        bonVsMonster += "+#{bonus} attack bonus against #{creature}s \n"
      end
    end
    
    #Compile a string for defense bonuses
    defBonuses = "Defense Bonuses: \n"
    if @defenseBonuses.empty?
      defBonuses += "None \n"
    else
      @defenseBonuses.each do | entity, bonus |
        defBonuses += "+#{bonus} defense bonus against #{entity}s \n"
      end
    end
    
    #Put together all combat data into a string
    combatData = "Combat Data: \nHP: #{@hp} \nSpeed: #{@speed}ft \nDarkvision Range: #{@darkvisionRange}ft \n\n" +
                 "#{immunities}\nAttack Bonus Modifier: #{@attackBonus} \n\n#{bonVsMonster}\n#{defBonuses}"
    
    #Compile a string for equipment proficiencies 
    equipProf = "Equipment Proficiencies: \n"
    if @equipmentProficiencies.empty?
      equipProf += "None"
    else
      @equipmentProficiencies.each do |prof|
        equipProf += "#{prof.capitalize} \n"
      end
    end
    
    #Compile a string for skills
    skills = "Skills: \n"
    if @skills.empty?
      skills += "None \n"
    else
      @skills.each do |skill|
        skills += "#{skill.capitalize} \n"
      end
    end
    
    divider = "================================================================================\n"
    
    #Put all the strings together
    string = "Character Name: #{@name.capitalize} \nGender: #{@gender.capitalize} \nRace: #{@race.capitalize} \n" + 
             "Class: #{@className.capitalize} \nLevel: 1 \nAlignment: #{@alignment.capitalize} \nSkill Ranks: #{@skillRanks} \n\n" +
             "#{levBon}\n#{startBon}#{divider}#{abil}#{divider}#{savThrows}#{divider}#{combatData}#{divider}" +
             "#{equipProf}#{divider}#{skills}#{divider}"
             
    return string
    
  end
  
end