class Bottles
  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def song
    verses(99,0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

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
