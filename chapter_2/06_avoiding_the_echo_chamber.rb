# Version 1
def test_the_whole_song
  bottles = Bottles.new
  assert_equal bottles.verses(99, 0), bottles.song
end

# Broken Bottles Song
class Bottles
  def song
    verses(99,0)
  end

  def verses(upper, lower)
    if upper == 99 && lower == 98
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n" +
      "\n" +
      "98 bottles of beer on the wall, " +
      "98 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "97 bottles of beer on the wall.\n"
    elsif upper == 2
      verse(2) + "\n" + verse(1) + "\n" + verse(0)
    else
      "ok"
    end
  end

  def verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{number-1} bottles of beer on the wall.\n"
    end
  end
end

# Version 2
def test_the_whole_song
  bottles = Bottles.new
  expected =
    99.downto(0).collect { |i| bottles.verse(i) }.join("\n")

  assert_equal expected, bottles.song
end

# Version 3
def test_the_whole_song
  expected = <<~SONG
    99 bottles of beer on the wall, 99 bottles of beer.
    Take one down and pass it around, 98 bottles of beer on the wall.
    98 bottles of beer on the wall, 98 bottles of beer.
    Take one down and pass it around, 97 bottles of beer on the wall.
    97 bottles of beer on the wall, 97 bottles of beer.
    Take one down and pass it around, 96 bottles of beer on the wall.
    # ...
    4 bottles of beer on the wall, 4 bottles of beer.
    Take one down and pass it around, 3 bottles of beer on the wall.
    3 bottles of beer on the wall, 3 bottles of beer.
    Take one down and pass it around, 2 bottles of beer on the wall.
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
  SONG

  assert_equal expected, Bottles.new.song
end

=begin
  In order to write cost effective tests, it's important to keep the test decoupled
from the object it is testing. The 99 bottles song is composed of one hundred
verses. One migth think the solution to avoid duplication is to writw the Version 1
test. That test is asserting that the output of song is the same as verses(99, 0),
not that song returns the expected lyrics.
  The test is tightly coupled to Bottles. It knows the existence of the method
verses, its arguments and where the song starts and finishes. This test should
instead be written as if the only thing you know about Bottles is that it answers
to the message song.
  The Version 1 test may return a false positive. Even if verses is not returning
the expected song the test will remain being green. Broken Bottles Song exemplifies
that case.
  Version 2 removes the call to verses and instead tests if the output of song is
the same as the implementation of verses. The test is still coupled, now to the
implementation details of the verses method.
  The answer here would be to explicitly assert the output of song aganist each
of its one hundred verses, as shown in Version 3. This is the only version that is
completely ignorant about Bottles class and verses existence and implementation.
It won't break if Bottles changes the way it implements things.
  The attempt to dry out the lengthy expected song would introduce an abstraction
to the test. Tests are not the place for abstractions (those belong in code),
they are the place for concretion. If you insist to abstract, logic that mirrors
Bottles implementations will be added to the test, which couples the objects.
=end
