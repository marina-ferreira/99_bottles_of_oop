=begin
  Finally the code is open for the six-pack requirement (not he factory, but the
rest is!). By updating the tests and running them the following error comes up:

  -Take one down and pass it around, 1 six-pack of beer on the wall.
  +Take one down and pass it around, 6 bottles of beer on the wall.

  -1 six-pack of beer on the wall, 1 six-pack of beer.
  +6 bottles of beer on the wall, 6 bottles of beer.

  The code is returning 6 when it should return 1, that is quantity. Instead of
six-pack it is returning bottles, that is container concept.

  1. Create a new class BottleNumber6 with the varying differences
  2. Update the factory

  💡 "Make the change easy (warning: this may be hard), then make the easy change"
  — Kent Beck
=end

class BottleNumber6 < BottleNumber
  def quantity
    1
  end

  def container
    "six-pack"
  end
end

class BottleNumber
  # [...]

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end.new(number)
  end
end
