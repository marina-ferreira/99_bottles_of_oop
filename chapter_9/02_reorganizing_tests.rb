=begin
  The next candidate to test would be BottleVerse. It is a simple object and yet
there is enough complexity in it that discloses the need for testing.
  While the previous BottleNumber/BottleVerse dependency was invisible to anyone
outside BottleVerse, the BottleVerse/Bottles dependency is exposed.
=end

require_relative '../chapter_7/final_version'

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

class Bottles
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  # ...

  def verse(number)
    verse_template.lyrics(number)
  end
end

=begin
  The technique used for this refactoring will be:

  * copy the test from the original place
  * paste into the new test class
  * alter the code so it works
  * delete the test from the old class

  The Bottles test class has several assertions about individual verses, so that
will be the starting point.
=end

gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'

class BottleVerseTest < Minitest::Test
  def test_the_first_verse
    expected =
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(99)
  end

  def test_another_verse
    expected =
      "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(3)
  end

  def test_verse_2
    expected =
      "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(2)
  end

  def test_verse_1
    expected =
      "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
     assert_equal expected, BottleVerse.lyrics(1)
  end

  def test_verse_0
    expected =
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(0)
  end
end
