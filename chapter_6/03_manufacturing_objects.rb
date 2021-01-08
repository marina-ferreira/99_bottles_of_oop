=begin
  When several objects play a role, there must be a place in the code (and just
one place) that holds the conditions to choose the right object. That place is
said o manufacture the correct role object and thus is called a factory and it is
responsible for isolating the name of the the concrete classes and to hide the
choosing logic.

  1. Isolate the BottleNumber instantiation in the Bottles class

    def bottle_number_for(number)
      BottleNumber.new(number)
    end

  2. Test number and manufacture the correct object

    def bottle_number_for(number)
      if number === 0
        BottleNumber0.new(number)
      else
        BottleNumber.new(number)
      end
    end

  Although the above code works, it mixes things that change from things that
remain the same. That can be further improved.

  3. In the quantity method in BottleNumber class leave the content of the false
branch only and erase the rest

    def quantity
      number.to_s
    end
=end

class Bottles
  # [...]

  def bottle_number_for(number)
    if number === 0
      BottleNumber0
    else
      BottleNumber
    end.new(number)
  end

  def verse(number)
    bottle_number = bottle_number_for(number)
    next_bottle_number = bottle_number_for(bottle_number.successor)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{next_bottle_number} of beer on the wall.\n"
  end
end

class BottleNumber
  # [...]

  def quantity
    number.to_s
  end
end

=begin
  *** Replace Conditional with Polymorphism Recipe ***

  1. Create a subclass to stand in for the value upon which you switch.
    a. Copy one method that switches on that value into the subclass.
    b. In the subclass, remove everything but the true branch of the conditional.
      i. At this point, create a factory if it does not yet exist, and
      ii. Add this subclass to the factory if not yet included.

    c. In the superclass, remove everything but the false branch of the conditional.
    d. Repeat steps a-c until all methods that switch on the value are dispersed.

  2. Iterate until a subclass exists for every different value upon which you switch.
=end
