def verse(number)
  case number
  when 0
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  else
    "#{number} #{container(number)} of beer on the wall, " +
    "#{number} #{container(number)} of beer.\n" +
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
    number
  end
end

=begin
  There's only verse 0 now. The smallest difference between them is "no more" vs
#{number} in lines 1 and 2. The quantity method is able to solve the difference
in line 2, but line 1 requires the capitalized version of the sentence.
=end

when 0
  "#{quantity(number).capitalize} bottles of beer on the wall, " +
  "#{quantity(number)} bottles of beer.\n" +
  "Go to the store and buy some more, " +
  "99 bottles of beer on the wall.\n"
else
  "#{quantity(number).capitalize} #{container(number - 1)} of beer on the wall, " +
  "#{quantity(number)} #{container(number - 1)} of beer.\n" +
  "Take #{pronoun(number)} down and pass it around, " +
  "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
end

=begin
  The change above has introduced an error:

  NoMethodError: undefined method `capitalize' for 99:Integer

  That happened because each branch in the quantity method returns a different
type. Liskov says "subtypes should be substitutable by their supertypes". The same
logic applies to duck types. When an object plays a role it has to honor the
contract and implement avery rule in that contract. Duck types should be
substitutable for one another.

"Liskov prohibits you from doing anything that would force the sender of a
message to test the returned result in order to know how to behave." - Sandi Metz

  In this case the true branch has honored the "capitalizable" contract, but the
false branch did not. That can be solved by converting number in the false branch.
The return becomes consistent.

  By also replacing the string bottles for the container message send, line 1
from both verses are now equal.
=end

def quantity(number)
  if number
    'no more'
  else
    number.to_s
  end
end

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
