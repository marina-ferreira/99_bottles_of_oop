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
  else
    "#{number} bottles of beer on the wall, " +
    "#{number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
  end
end

def container(number)
  if number == 1
    "bottle"
  else
    "bottles"
  end
end

=begin
  On to the next refactoring. The steps from the prevoius chapter should be
repeated. What are the cases that are most alike? Verses 0 and 1 have more things
in common with the else branch than between each other. Verse 1 and else are the
most alike right now.
=end

# Version 1
when 1
  "1 bottle of beer on the wall, " +
  "1 bottle of beer.\n" +
  "Take it down and pass it around, " +
  "no more bottles of beer on the wall.\n"
else
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
end

=begin
  Lines 1 and 2 from Verse one may be refactored to use the number variable and
then the container method. The third line differs on "it" and "one" words. That
represents a smaller abstraction within the larger one (same as chapter 3). It
has to be recognized, extracted and substituted for a single message send. That
abstraction is harder to identify than the container one. "thing_drunk" is too
general, while "it_or_one" is too narrow. "It" or "one" represent a "pronoun" in
the context of the song. It may be a little general but it's clear.
=end

# Version 1
when 1
  "#{number} #{container(number)} of beer on the wall, " +
  "#{number} #{container(number)} of beer.\n" +
  "Take it down and pass it around, " +
  "no more bottles of beer on the wall.\n"
else
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
end

# Version 2
when 1
  "#{number} #{container(number)} of beer on the wall, " +
  "#{number} #{container(number)} of beer.\n" +
  "Take #{pronoun(number)} down and pass it around, " +
  "no more bottles of beer on the wall.\n"
else
  "#{number} #{container(number)} of beer on the wall, " +
  "#{number} #{container(number)} of beer.\n" +
  "Take #{pronoun(number)} down and pass it around, " +
  "#{number - 1} #{container(number - 1)} of beer on the wall.\n"
end

def pronoun(number)
  if number == 1
    'it'
  else
    'one'
  end
end
