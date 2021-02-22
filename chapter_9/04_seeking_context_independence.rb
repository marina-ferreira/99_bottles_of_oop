=begin
  The Bottles class was created to fullfil a requirement. But after several
rouds of refactoring, Bottles has become much more abstract and generally useful,
making its name is misleading to the new reader.

  "Classes should be named after what they are: what is this?"

  It is a Song, but not any kind of song, as disclosed by the downto call in the
verses method. It's a CountdownSong.
=end

class Bottles
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

=begin
  For this refactoring the one-undo chnages technique will be used. Steps are the
following:

  * Duplicate Bottles class and rename it
  * Update the test class name
  * Update every call to Bottles in the test
  * Delete the old Bottles class
=end

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
    assert_equal expected, CountdownSong.new.verses(99, 98)
  end

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

  def test_the_whole_song
    expected = <<~SONG
      99 bottles of beer on the wall, 99 bottles of beer.
      Take one down and pass it around, 98 bottles of beer on the wall.

      98 bottles of beer on the wall, 98 bottles of beer.
      Take one down and pass it around, 97 bottles of beer on the wall.

      ...

      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.

      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    SONG
    assert_equal expected, CountdownSong.new.song
  end
end
