def verse(number)
  case number
  when 0
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  when 1
    "#{number} #{container(number)} of beer on the wall, " +
    "#{number} #{container(number)} of beer.\n" +
    "Take #{pronoun(number)} down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  else
    "#{number} #{container(number)} of beer on the wall, " +
    "#{number} #{container(number)} of beer.\n" +
    "Take #{pronoun(number)} down and pass it around, " +
    "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
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

=begin
  The difference now lies under the last phrase: "no more" vs #{number - 1}. The
same technique used to reveil container and pronoun may be used here.

    | Number    |      ?     |
    | --------- | ---------- |
    | 99        | '99'       |
    | 50        | '50'       |
    | 1         | '1'        |
    | 0         | 'no more'  |

  The right column quantity of bottles being sung about. It is the string to be
sung in the place of any number. Quantity indicates the responsability of the
method.

  1) create the quantity method
  2) return the string "no more"
  3) call the method in the 1 branch
  4) add 0 as an optional parameter
  5) add the conditional no more/0 according to the number param
  6) Add the parameter to the call of the method in the 1 branch
  7) call the method in the else branch
  8) delete two 1
  9) Switch "bottles" in the 1 branch with container method
=end

def quantity(number)
  if number
    'no more'
  else
    number
  end
end

when 1
  "#{number} #{container(number)} of beer on the wall, " +
  "#{number} #{container(number)} of beer.\n" +
  "Take #{pronoun(number)} down and pass it around, " +
  "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
else
  "#{number} #{container(number)} of beer on the wall, " +
  "#{number} #{container(number)} of beer.\n" +
  "Take #{pronoun(number)} down and pass it around, " +
  "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
end

=begin
  The verses are now identical, so branch 1 can be removed:
=end

def verse(number)
  case number
  when 0
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  else
    "#{number} bottles of beer on the wall, " +
    "#{number} bottles of beer.\n" +
    "Take #{pronoun(number)} down and pass it around, " +
    "#{quantity(number - 1)} #{container(number - 1)} of beer on the wall.\n"
  end
end
