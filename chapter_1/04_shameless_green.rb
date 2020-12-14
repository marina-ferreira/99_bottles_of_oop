class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map do |i|
      verse(i)
    end.join("\n")
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

=begin
  So far the first three solutions are costly, each in their own way:

  1st: terseness
  2nd: complexity in an attempt to achieve extensibility
  3rd: lack of overall comprehension in an attempt to achieve dryness

  The above solution prioritizes understandability over changeability. It is
simple and it does answer all questions:

  Domain:

  1. How many verse variants are there?
  Clearly, four.
  2. Which verses are most alike? In what way?
  3-99, where only the verse number varies.
  3. Which verses are most different? In what way?
  0, 1 and 2 are different from 3-99, though figuring out how requires parsing
  strings with your eyes.
  4. What is the rule to determine which verse should be sung next?
  This is still not explicit. The 0 verse contains a deeply buried, hard-coded 99.

  Value/Cost:

  1. How difficult was this to write?
  It was easy to write.
  2. How hard is it to understand?
  It is easy to understand.
  3. How expensive will it be to change?
  It will be cheap to change. Even though the verse strings are duplicated, if
  one verse changes it’s easy to keep the others in sync

  The code presents string duplication and has very few named abstractions. It
does not make many assumptions on future changes. But considering how not likely
it is for this song to change, the code is good enough. One of the biggest
challenges of design is knowing when to stop, and deciding well requires making
judgments about code.
=end
