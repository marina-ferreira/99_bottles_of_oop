def test_verse_2
  expected =
    "2 bottles of beer on the wall, " +
    "2 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "1 bottle of beer on the wall.\n"

  assert_equal expected, Bottles.new.verse(2)
end

# Version 1
def verse(number)
  if number == 2
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

# Version 2
def verse(number)
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number-1} bottle#{'s' unless (number-1) == 1} of beer " +
  "on the wall.\n"
end

=begin
  The text for the next verse produces the two snippets above. Version 1 wraps
the code in a new condition, while Version 2 uses interpolation.

  | Version    | SLOC | Cyclomatic<br>Complexity | ABC    |
  | ---------  |:----:| ------------------------:| ------:|
  | 1          | 13   | 2                        | 2      |
  | 12         | 7    | 2                        | 2      |

  Each version has a condition and none has variable assignment, so their Cyclomatic
Complexity and ABC are the same. The only difference between them is the SLOC.
Version 2 is almost half size. Normally a shorter code would indicate the best
option. But not in this case.

  "#{number-1} bottle#{'s' unless (number-1) == 1} of beer " +

  This inline condition has made the code shorter, but also harder to understand.
DRY principle should be used with caution. If applied too early, it may decrease
understandability and have a negative impact on future abstractions. DRY should
be applid when:

  * Does the change I’m contemplating make the code harder to understand?
  When abstractions are correct, code is easy to understand.

  * What is the future cost of doing nothing now?
  If it doesn’t increase your costs, delay making changes.

  * When will the future arrive, or how soon will I get more information?
  Coding up a number of slightly duplicative examples will reveal the correct
  abstraction. It’s better to tolerate duplication than to anticipate the wrong
  abstraction.

  Version 1 has some duplication but it does not create an abstraction before it
should, so although it is longer, it is the better option.
=end

def verse
  #...
  "#{number-1} #{pluralize(number)} of beer "
  #...
end

def pluralize(number)
  "bottle#{'s' unless (number-1) == 1}"
end

=begin
  The code above shows an example of an incorrect premature abstraction. The inline
condition was abstracted to a method named pluralize. Since the word bottle is
duplicated several times it was extracted al well. Although the word bottle/bottles
do have a meaning and also have things in common, pluralization is not it. Now that
the wrong abstraction was created, their commonality is harder to be seen. This is
what happens when DRY is misapplied.
=end
