=begin
  Right now, the successor method is not obeying Liskov Substitution Principle.
It is expected that the successor method returns an object that acts like a
BottleNumber, but it actually returns an Integer. That obliges every sender to know
how to convert the integer back to what it was supposed to be in the first place.
If the method obeyed Liskov the code in the verse method could be simplified:

  next_bottle_number = bottle_number_for(bottle_number.successor)
  next_bottle_number = bottle_number.successor

  This problem is closer to a real world one, since in order to be solved it is
necessary to change many implementors and senders. The technique may be used to
cure any type chnage problems.

  1. Put the factory within successor reach by creating a class method

  The method name is updated from bottle_number_for to just for because that is
more abstract and supports polymorphism. If the BottleNumber class name ever chnages,
bottle_number_for qould have to be changed as well. It's for the same reason why
to_s is named simply to_s. Several types implement this method, adding a type
specific name would generate array_to_s, string_to_s methods and the sender would
have to test the object in order to send the message.

  2. Change the two successor methods in BottleNumber and BottleNumber0 to invoke
the factory.

  Unfortunately any chnage on that direction will break the tests. The trick to
moving forward using one-line changes is to temporarily alter the factory to
tolerate both kinds of input. That can be done with the following temporary
condition added to the factory.

  return number if number.kind_of?(BottleNumber)

  With that the successor methods in BottleNumber and BottleNumber0 may be
updated without breaking the tests.

  BottleNumber.for(number - 1)

  BottleNumber.for(99)

  3. Now it is possible to update the verse method to expect that successor returns
a BottleNumber object

  next_bottle_number = bottle_number.successor

  4. Temporary variables like next_bottle_number, that are used just once can be
removed with the Inline Temp refactoring

  5. Last but not least, the guard clause in the factory is now obsolete and can
be removed.

  return number if number.kind_of?(BottleNumber)
=end

class BottleNumber
  # [...]

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

def verse(number)
  bottle_number = BottleNumber.for(number)

  "#{bottle_number} of beer on the wall, ".capitalize +
  "#{bottle_number} of beer.\n" +
  "#{bottle_number.action}, " +
  "#{bottle_number.successor} of beer on the wall.\n"
end

class BottleNumber0 < BottleNumber
  def successor
    BottleNumber.for(99)
  end
end
