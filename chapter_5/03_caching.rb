class Bottles
  def song
    verses(99,0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def container(number)
    BottleNumber.new(number).container
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def successor(number)
    BottleNumber.new(number).successor
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def successor
    if number == 0
      99
    else
      number - 1
    end
  end
end

=begin
  Each time the verse method is called 9 instances of BottleNumber are created,
which means that through out te song 900 BottleNumbers are instantiated.
  The first three lines send the messages quantity, container (2) and action (2)
creating 5 instances of BottleNumber for 99. The fourth line sends successor twice,
creating yet another 2 instances of BottleNumber 99. quantity and container are
also called, but here with the number 98. If the instance for BottleNumber 99
was cached it could be reused 6 times.
=end

def verse(number)
  bottle_number = BottleNumber.new(number)
  next_bottle_number = BottleNumber.new(bottle_number.successor)

  "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " +
  "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
  "#{bottle_number.action}, " +
  "#{next_bottle_number.quantity} #{next_bottle_number.container} of beer on the wall.\n"
end

=begin
  Although line 97 represents the Temporary Variable code smell, the object
creation is being reduced without a lot of complexity, so it's acceptable. The
caching removes the need for the flocked five methods that can be erased.
=end
