# Ability.rb
# Author:: Chase Hennion
# 
# The ability class stores the raw point score and point score modifier for an ability
# Ability scores are determined by rolling 4D6, dropping the lowest score, and summing the 
# remaining three dice. The modifier is determined from the raw score. The higher the score, 
# the higher the modifier

class Ability
  
  attr_reader :ptScore
  attr_reader :modifier
  
  # Creates a new Ability instance.
  # * ptScore  The ability score
  def initialize( ptScore )
    @ptScore = ptScore
    @modifier = determineModifier
  end
  
  private 
  
  # Determines the ability modifier based upon the ability score
  def determineModifier
    #Look up modifier based upon pt score
    case @ptScore
    when 1
      @modifier = -5
    when 2, 3
      @modifier = -4
    when 4, 5
      @modifier = -3
    when 6, 7
      @modifier = -2
    when 8, 9
      @modifier = -1
    when 10, 11
      @modifier = 0
    when 12, 13
      @modifier = 1
    when 14, 15
      @modifier = 2
    when 16, 17
      @modifier = 3
    when 18, 19
      @modifier = 4
    when 20 
      @modifier = 5
    else
      puts "Bad Pt Score '#{@ptScore}'! Cannot determine modifier!"
    end
    
  end
  
end