def verse(number)
  case number
  when 0
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "99 bottles of beer on the wall.\n"
  else
    "#{quantity(number).capitalize} #{container(number-1)} of beer on the wall, " +
    "#{quantity(number)} #{container(number-1)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(number-1)} #{container(number-1)} of beer on the wall.\n"
  end
end

def pronoun(number)
  if number == 1
    'it'
  else
    'one'
  end
end

def container(number)
  if number == 1
    "bottle"
  else
    "bottles"
  end
end

def quantity(number)
  if number
    'no more'
  else
    number.to_s
  end
end

def action(number)
  if number == 0
    "Go to the store and buy some more"
  else
    "Take #{pronoun(number)} down and pass it around"
  end
end

=begin
  The last line of the verse differs in 99 vs #{quantity(number-1)}. The string
99 can be substituted by #{quantity(99)}. The responsability of this part is to
know that when number is 50 it should return 49. 5 should return 4 and 0 should
return 99. Taken under consideration that the song direction is down, successor
sounds like a good candidate for a name. By replacing the method in the branches,
verse 0 and the else branch are now the same and the case statement may be erased.
=end

def successor(number)
  if number == 0
    99
  else
    number - 1
  end
end

# Version 1
def verse(number)
  case number
  when 0
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
  else
    "#{quantity(number).capitalize} #{container(number-1)} of beer on the wall, " +
    "#{quantity(number)} #{container(number-1)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
  end
end

# Version 2
def verse(number)
  "#{quantity(number).capitalize} #{container(number-1)} of beer on the wall, " +
  "#{quantity(number)} #{container(number-1)} of beer.\n" +
  "#{action(number)}, " +
  "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
end
