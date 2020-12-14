def test_verse_1
  expected =
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"

  assert_equal expected, Bottles.new.verse(1)
end

def verse(number)
  case number
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

=begin
  Verse 1 differs from others in a whole other way:

  * It says "Take it down" instead of "Take one down"
  * It ends with "no more bottles" instead of "0 bottles"
  * It begins with "1 bottle" instead of "1 bottles"

  For this solution there are the same two options as the last example. A condition
has to be added. You might choose to interpolte the logic or not. The answer is
also the same as before. The cost paid with a code that becomes confusing is to
high for just saving a few lines of code. So a third condition is inserted.

  The if statments where switched to case. The use of case implies that the
condition tested remains the same. If/elsif means that each condition varies in
a meaninful way. Case stametments make the code easier to read.
=end

def test_verse_0
  expected =
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"

  assert_equal expected, Bottles.new.verse(0)
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
    "#{number - 1} bottles of beer on the wall.\n"
end

=begin
  Verse 0 also has its own specificities:

  * It says "No/no more bottles" instead of "0 bottles"
  * It says "Go to the store and buy some more" instead of "Take it/one down
  and pass it around"
  * It ends with "99 bottles"

  Following the same logic, the solution is to add yet another conditional branch
to handle those variations.
  The final result answers the domain questions. There are for verse variations.
Verses 0, 1 and 2 vary eachin their won way and verses 3 to 99 are common and
therefor produced by the same piece of code.
  It's easy to understand because there are not levels of indirection due to the
minimum amount of abstractions.
=end
