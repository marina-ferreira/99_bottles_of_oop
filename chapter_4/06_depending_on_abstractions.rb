def verse(number)
  "#{quantity(number).capitalize} #{container(number-1)} of beer on the wall, " +
  "#{quantity(number)} #{container(number-1)} of beer.\n" +
  "#{action(number)}, " +
  "#{quantity(successor(number))} #{container(number-1)} of beer on the wall.\n"
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

def successor(number)
  if number == 0
    99
  else
    number - 1
  end
end

=begin
  There are several calls to the container method with number - 1 as argument.
Although the test passes, when number is 0, the argument passed does not represent
a valid amount of bottles. What the container wants actually is the string matching
the successor of number, therefore, those calls should be replaced by a call to
container(successor(number)).
=end

def verse(number)
  "#{quantity(number).capitalize} #{container(successor(number))} of beer on the wall, " +
  "#{quantity(number)} #{container(successor(number))} of beer.\n" +
  "#{action(number)}, " +
  "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
end
