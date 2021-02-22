=begin
  The BottlesTest has morphed from unit test to integration. It tested the Bottles
unit and now it is testing the entire chain behaviour, Bottles, BottleVerse,
BottleNumber and all its hierarchy. Each one of this classes should get their
own unit test, for the public API.
  The starting point should be the smallest, easiest, most untangled object, which
in this context is the BottleNumber1 class.
=end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

=begin
  Examining BottleNumber1#pronoun for example, the amount of code in that method
is so small and specifc, that the only option for a test would be:
=end

assert_equal 'it', BottleNumber1.new(1).pronoun

=begin
  The code is so small that the test is completely coupled to the method. If the
method changes, the test must change as well. The cost in this case to write a
test for this class is too high. Furthermore, BottleNumbers are:

  * small
  * simple
  * invisible from outside of BottleVerse
  * used in no context other than BottleVerse

  The default choice is to have unit tests for every class. But in this case, it
would be okay to inject the BottleNumber1 test into some other object test. This
would generate an integration test, but if BottleNumber1 is thought as a private
object, it goes back being a unit test. Lowering the costs is the only excuse
acceptable for not extracting BottleNumber1 test to its own class.
=end
