def verse(number)
  case number
  when 0
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  else
    "#{quantity(number).capitalize} #{container(number-1)} of beer on the wall, " +
    "#{quantity(number)} #{container(number-1)} of beer.\n" +
    "Take #{pronoun(number)} down and pass it around, " +
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

=begin
  Now on to the third line. The only thing similiar between them is the trailing
comma, the rest is different. The line represents the action taken according to
the amount of bottles.
=end

def action(number)
  if number == 0
    "Go to the store and buy some more"
  else
    "Take #{pronoun(number)} down and pass it around"
  end
end

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
