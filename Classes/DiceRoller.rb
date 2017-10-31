# DiceRoller.rb
# Author:: Chase Hennion
#
# The DiceRoller class is used to randomly generate ability scores for characters. The class can
# be specialized for the number and type of dice to roll. For Pathfinder, abilities are generated
# by rolling 4D6, discarding the lowest roll, and summing the remaining dice rolls.

class DiceRoller
  
  attr_reader :numDice
  attr_reader :numSides
  
  # Creates a new DiceRoller instance
  # * numDice  The number of dice to roll
  # * numSides  The number of sides on each die
  def initialize( numDice, numSides )
    @numDice = numDice
    @numSides = numSides
  end
  
  public
  
  # Performs dice rolls to determine an ability score
  def abilityRoll
    # Roll numDice dice, discard lowest score, sum, return
    sum = 0
    gen = Random.new
    rolls = Array.new
    goodRoll = false
    
    while goodRoll == false
      
      rolls.clear
      sum = 0
      
      @numDice.times do
           rolls.push( gen.rand( @numSides ) + 1 )
         end
         
         # Sort values, discard minimum
         rolls.sort!.shift
         
         rolls.each do |value|
           sum += value
         end
         
         goodRoll = true unless sum <= 13
         
     end
       
       return sum
    
  end
  
end