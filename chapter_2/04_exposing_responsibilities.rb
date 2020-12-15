def test_a_couple_verses
  expected =
    "99 bottles of beer on the wall, " +
    "99 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "98 bottles of beer on the wall.\n" +
    "\n" +
    "98 bottles of beer on the wall, " +
    "98 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "97 bottles of beer on the wall.\n"

  assert_equal expected, Bottles.new.verses(99, 98)
end

def test_a_couple_verses
  expected =
    "99 bottles of beer on the wall, " +
    "99 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "98 bottles of beer on the wall.\n" +
    "\n" +
    "98 bottles of beer on the wall, " +
    "98 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "97 bottles of beer on the wall.\n"

  assert_equal expected, Bottles.new.verses(99, 98)
end

# Version 1
def verses(_, _)
  "99 bottles of beer on the wall, " +
  "99 bottles of beer.\n" +
  "Take one down and pass it around, " +
  "98 bottles of beer on the wall.\n" +
  "\n" +
  "98 bottles of beer on the wall, " +
  "98 bottles of beer.\n" +
  "Take one down and pass it around, " +
  "97 bottles of beer on the wall.\n"
end

# Version 2
def verses(_, _)
  verse(99) + "\n" + verse(98)
end

=begin
  Following the idea that each test should cover the smallest possible thing, the
first test for the verses method should test the smallest possible combinatiion
of verses, which is two.

  Some of Kent Beck's "Green Bar Patterns" that describe ways to make tests pass:

  1. Fake It ("Til You Make It")
  2. Obvious Implementation
  3. Triangulate

  Although Version 1 does make the test green, the duplication here is not a good
solution for two reasons: it obscures the real responsibility of the method verses
and it duplicates logic that already exists. It does not create intention revealing
code, it duplicates a logic that has already been identified.
  Version 2 makes a better job of revealing verses responsibility, which is call
the method verse (who is responsible for knowing the song) with the correct arguments
to produce the song.
  Versions 1 and 2 represent the "Fake it", since neither is the complete solution.
It may seem tedious to write this in such small steps but those are supposed to
incrementaly reveal the right implementation. Going straight to the "Obvious
Implementation" is ok if you are right, but in case you are not that mistake will
cascade.

  The next test asserts a different range if verses. Comparing the two solutions,
Version 4 is more abstract, it adds a loop that is easy to understand and just as
cheap to implement. It clearly exposes the responsibility of verses to produce any
range of verses, so it is the best alternative.
=end

def test_a_few_verses
  expected =
    "2 bottles of beer on the wall, " +
    "2 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "1 bottle of beer on the wall.\n" +
    "\n" +
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n" +
    "\n" +
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"

  assert_equal expected, Bottles.new.verses(2, 0)
end

# Version 3
def verses(upper, lower)
  if upper == 99
    verse(99) + "\n" + verse(98)
  else
    verse(2) + "\n" + verse(1) + "\n" + verse(0)
  end
end

# Version 4
def verses(upper, lower)
  upper.downto(lower).collect { |i| verse(i) }.join("\n")
end

