=begin
  There is still the test method song to be refactored. Now it's a wall of text,
that counts a story that now encompasses a broader context. Updating it with
VerseFake would reduce its size and remove the bottles context, but there would
still be 100 verses. That block of text is created by the hard coded 99 on the
song method. That, along with the BottleVerse as verse_template default and the
Botlles class name, that has already been updated, are remnants of the old 99
bottles context.
  Right now the method song depends on concretions, 99 and 0. That dependency can
be inverted, by extracting and isolating the things that change.
=end

# version 1
class CountdownSong
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

# version 2
class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template: BottleVerse, max: 99, min: 0)
    @verse_template = verse_template
    @max = max
    @min = min
  end

  def song
    verses(max, min)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

=begin
  The dependency inversion applied to the code allows the simplification of
test_the_whole_song, that can be shortened to:
=end

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

  def test_song
    expected =
      "This is verse 47.\n" + "\n" +
      "This is verse 46.\n" + "\n" +
      "This is verse 45.\n" + "\n" +
      "This is verse 44.\n" + "\n" +
      "This is verse 43.\n" assert_equal(
        expected,
        CountdownSong.new(
          verse_template: VerseFake,
          max: 47,
          min: 43
        ).song
      )
  end
end

=begin
  The last thing to be done is to rename test_the_whole_song to test_song, so it
follows the pattern.
=end
