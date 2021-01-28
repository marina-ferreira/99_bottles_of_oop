=begin
  The final issue yet to be addressed is the concretion BottleNumber inside lyrics.
lyrics depends on BottleNumber and for and there is a Blank Line code smell that
suggests it has more than one responsibility.
  The number argument is used only once, where it's converted to something else.
So the converted version of number should be provided to the lyrics method instead
of number.

  Applications most easily adapt to the unknown future if they follow the bellow
guidelines:

    a) resist giving instance methods knowledge of concrete class names, and
    b) seek opportunities to move the object creation towards the edges of the
       application.

  BottleNumber.for(number) will then be moved into the lyrics class method, grouping
object creation into one place and separating it from use. The instance variable
number has to be renamed to bottle_number to make sense once again.
=end

class BottleVerse
  def self.lyrics(number)
    new(BottleNumber.for(number)).lyrics
  end

  attr_reader :bottle_number

  def initialize(bottle_number)
    @bottle_number = bottle_number
  end

  def lyrics
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

=begin
  This chapter suggested five precepts that belong in everyone’s object-oriented
programming aesthetic:

  1) Put domain behavior on instances.
  2) Be averse to allowing instance methods to know the names of constants.
  3) Seek to depend on injected abstractions rather than hard-coded concretions.
  4) Push object creation to the edges, expecting objects to be created in one
     place and used in another.
  5) Avoid Demeter violations, using the temptation to create them as a spur to
     search for deeper abstractions.
=end
