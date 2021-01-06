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
  The flocked five methods present a dominant code smell, the *Primitive Obsession*.
That smell consists of using primitive types, such as String, Array, Integer, Hash
to represent a concept on your domain. The cure for that is to extract that logic
into a separate class to be used in the place of the primitive (Extract Class).

  💡 "Obsessing on a primitive results in code that passes built-in types around
and supplies behavior for them." - Sandi Metz

  Last chapter discussed method naming and that they should be named after an
abstraction one level higher. While that works well for methods, this idea should
not be applied to classes.

  💡 "You should continue to name methods after what they mean, classes can be
named after what they are." - Sandi Metz

  In order to extract the BottleNumber class, the following steps are taken while
running the tests at each change:

    1. Create an empty BottleNumber class
    2. Copy the working code from Bottle and paste into BottleNumber (flocked 5)
    3. Add an initialize method and an attr_reader for :number
    4. Update the methods in Bottle to call BottleNumber
      BottleNumber.new(number).quantity(number)

    5. Alter method definition to take an optional argument with a different name
      def quantity(delete_me=nil)
    6. Remove the argument from the method call in Bottles class
      BottleNumber.new(number).quantity
    7. Remove the optional argument from the method definition
      def quantity
=end
