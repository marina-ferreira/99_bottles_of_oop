=begin
  Although the name of the class has been changed to one with a broader meaning,
by taking a closer look at the tests, it's possoble to see they are still bound
to the bottles context. "An object is more reusable when ot knows less". Which
means, the smaller the object's context, easier it will be to place it somewhere
else.
  The second expectation removes the bottles context from the test. And makes it
perfectly clear that the song is about verses that count down.
=end

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

expected =
  "This is verse 99.\n" +
   "\n" +
  "This is verse 98.\n" +
   "\n" +
  "This is verse 97.\n"

=begin
  In order to apply the loosen expectation, it is necessary to create a new player
of the verse template role.
=end

class VerseFake
  def self.lyrics(number)
    "This is verse #{number}.\n"
  end
end

=begin
  Although the above class breaks a couple of rules, like having a pattern name
and it holds domain behavior in the class instead of placing it in an instance.
Those rules must be followed in production code, but when ot comes to testing, the
benefits of breaking this rules might be worth it. The pattern name makes its
purpose clear and to class method simplifies the code. Since that class will be
used solely in tests the down sides are not costy.
=end

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../chapter_7/final_version'
require_relative '../chapter_8/final_version'


class CountdownSong
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def song
    verses(99,0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

class CountdownSongTest < Minitest::Test
  def test_verses
    expected =
      "This is verse 99.\n" +
      "\n" +
      "This is verse 98.\n" +
      "\n" +
      "This is verse 97.\n"
    assert_equal expected, CountdownSong.new(verse_template: VerseFake).verses(99, 97)
  end

  def test_verse
    expected =  "This is verse 500.\n"
    assert_equal expected, CountdownSong.new(verse_template: VerseFake).verse(500)
  end

  def test_the_whole_song
    expected = <<~SONG
      99 bottles of beer on the wall, 99 bottles of beer.
      Take one down and pass it around, 98 bottles of beer on the wall.

      98 bottles of beer on the wall, 98 bottles of beer.
      Take one down and pass it around, 97 bottles of beer on the wall.

      ...

      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.

      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.

      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    SONG
    assert_equal expected, CountdownSong.new.song
  end
end

=begin
Now that the song context has been reduced, test_a_few_verses method is no longer
needed. Verses 2, 1 and 0 where meaningful in the context of Bottles song. Outside
that context they don't actually differs from 98, 48, or 27. The test_a_couple_verses
already asserts that countdown verses are returned correctly and that is already
enough. Therefore, test_a_few_verses may be deleted.

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
    assert_equal expected, CountdownSong.new.verses(2, 0)
  end

  All the verse tests were extracted to the BottleVerse test, where they belong.
But since CountdownSong has the verse method in its public api, it needs its own
test too. Named test_verse, it tests a number outside the range of 99 bottles, to
expose that CountdownSong is not constrained to that range. And since this test
is called test_verse, test_a_couple_verses should be renamed to test_verses, so
all tests names follow the same pattern.
=end
