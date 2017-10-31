# HelpText.rb
# Author:: Chase Hennion
#
# The HelpText module stores explanatory text for each step in the character creation process.

module HelpText
  
  # Manual Character Generation Mode Help
  MANUAL = "Manual: Allows you to specify all aspects of your character. Select this mode \n" +
           "if you would like the maximum amount of control over your character.\n\n"
  
  # Automatic Character Generation Mode Help
  AUTO = "Automatic: Generates a random character with abilities geared towards a specified \n" +
         "class. Select this mode if you would like to rapidly generate a character.\n\n"
  
  # Name Help
  NAME = "Enter the name that you would like your character to be called in the game. \n" +
         "Your character's name is limited only by your imagination.\n\n"
  
  # Gender Help
  GENDER = "If you would like your character to be a man, select the male gender. \n" +
           "If you would like your character to be a woman, select the female gender.\n\n"
  
  # Dwarf Race Help
  DWARF = "Dwarves are tough and hardy. They can see in the dark and are skilled at \n" +
          "battling a variety of monsters. They are shorter than humans and elves and \n" +
          "have a stout build. They are also typically bearded. Dwarves receive a +2 bonus \n" +
          "to constitution and wisdom and a -2 detriment to charisma.\n\n"
  
  # Elf Race Help    
  ELF = "Elves are agile and sharp-eyed. They are swift and skilled with many weapons. \n" +
        "Elves are typically taller than humans with fair features and pointed ears. \n" +
        "Elves receive a +2 bonus to dexterity and intelligence and a -2 detriment to constitution.\n\n"
  
  # Human Race Help
  HUMAN = "Humans are skilled and versatile. They learn quickly and excel at more things \n" +
          "initially than either Dwarves or Elves. Humans come in all shapes and sizes. \n" +
          "Humans receive a +2 bonus to the ability score that is best for their chosen class.\n\n"
  
  # Wizard Class Help
  WIZARD = "Wizards are masters of magic. Though physically fragile, \n" +
            "they are equipped with powerful magic.\n\n"

  # Rogue Class Help
  ROGUE = "Rogues are quick, stealthy characters. They excel at placing, \n" + 
          "detecting, and disabling traps and can deal great damage to \n" + 
          "enemies by attacking then from behind.\n\n"
  
  # Cleric Class Help        
  CLERIC = "Clerics are warrior-priests. They battle enemies and heal allies \n" + 
           "using powerful spells bestowed by their patron god.\n\n"
  
  # Fighter Class Help
  FIGHTER = "Fighters are characters hardened by the forge of war. \n" +
             "They are strong and durable characters, excelling in \n" +
             "all types of weapons and armor.\n\n"
  
  # Strength Attribute help
  STR = "Strength (STR): How strong you are. High strength means your weapons deal \n" + 
         "more damage. Fighters need a high strength.\n\n"
  
  # Dexterity Attribute help
  DEX = "Dexterity (DEX): How agile you are. High dexterity means you're better with \n" + 
         "ranged weapons and are harder to hit in combat. Rogues need a high dexterity.\n\n"
  
  # Constitution Attribute help
  CON = "Constitution (CON): How physically resilient you are. High constitution means \n" +
         "you have more health and are better at resisting poisons.\n\n"
  
  # Intelligence Attribute help
  INT = "Intelligence (INT): How smart you are. High intelligence means you get more skills. \n" + 
         "Wizards need a high intelligence.\n\n"
  
  # Wisdom Attribute help
  WIS = "Wisdom (WIS): How aware and intuitive you are. High wisdom means you are perceptive. \n" +
         "Clerics need a high wisdom.\n\n"
  
  # Charisma Attribute help
  CHA = "Charisma (CHA): How persuasive you are. If you like to talk your way out of trouble, \n" +
         "you need a high charisma.\n\n"
  
  # Alignment help
  ALIGNMENT = "Every creature has an alignment that indicates its general morals and attitude. \n" + 
               "Pick one of the following:\n\n"
  
  # Lawful Good Help
  LAW_GOOD = "Lawful Good (LG): You combine honor with compassion.\n\n"
  
  # Neutral Good Help
  NEUT_GOOD = "Neutral Good (NG): You believe in doing what is good and right without \n" +
              "bias for or against law and order.\n\n"
  
  # Chaotic Good Help
  CH_GOOD = "Chaotic Good (CG): You combine a good heart with a free spirit.\n\n"
  
  # Lawful Neutral Help
  LAW_NEUT = "Lawful Neutral (LN): You are reliable and honorable without begin devoted \n" +
             "to doing good deeds.\n\n"
  
  # Neutral Help
  NEUT = "Neutral (N): You act without prejudice or compulsion.\n\n"
  
  # Chaotic Neutral Help
  CH_NEUT = "Chaotic Neutral (CN): You are free from society's restrictions of do-gooders' \n" +
            "strict ethics.\n\n"
  
  # File Saving Help
  FILE = "Enter a name for the file that will contain your generated character's information. \n" +
         "The file will be saved in #{Dir.pwd}/Generated_Characters \n" +
         "This will allow you to view and print your character's information from a text editor. \n" +
         "Note that providing the name of an existing file in the Generated_Characters directory \n" +
         "will cause the existing file to be overwritten.\n\n"
  
  #Help Lookup Hash
  HELP = { 1 => "#{MANUAL}#{AUTO}" ,
           2 => "#{CLERIC}#{FIGHTER}#{ROGUE}#{WIZARD}" ,
           3 => GENDER ,
           4 => "#{ALIGNMENT}#{LAW_GOOD}#{NEUT_GOOD}#{CH_GOOD}#{LAW_NEUT}#{NEUT}#{CH_NEUT}" ,
           5 => "#{DWARF}#{ELF}#{HUMAN}" ,
           6 => "#{STR}#{DEX}#{CON}#{INT}#{WIS}#{CHA}", 
           7 => NAME ,
           8 => FILE  
         }
end




