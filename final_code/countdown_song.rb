class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template:, max: 999999, min: 0)
    @verse_template = verse_template
    @max, @min = max, min
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
