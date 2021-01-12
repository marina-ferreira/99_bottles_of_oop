=begin
  A intention-revealing technique, that is quite efficient although risky is
Wishful Thinking. What is the code you wish you had?
  That technique may be used in this example to refactor the ambiguous argument
number. One may ask the following questions:

  1. What code do you wish you had?
  2. What message should Bottles expect to send to BottleVerse to get back the
     words in a verse?
  3. What does Bottles want from BottleVerse? It wants lyrics.
=end

class Bottles
  def verses(song)
    BottleVerse.new(number).verse(number)
  end
end

class Bottles
  def verses(song)
    BottleVerse.new(number).lyrics
  end
end
