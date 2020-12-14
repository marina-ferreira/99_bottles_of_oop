class Bottles
  NoMore = lambda do |verse|
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  end

  LastOne = lambda do |verse|
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  Penultimate = lambda do |verse|
    "2 bottles of beer on the wall, " +
    "2 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "1 bottle of beer on the wall.\n"
  end

  Default = lambda do |verse|
    "#{verse.number} bottles of beer on the wall, " +
    "#{verse.number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{verse.number - 1} bottles of beer on the wall.\n"
  end

  def song
    verses(99, 0)
  end

  def verses(finish, start)
    (finish).downto(start).map do |verse_number|
      verse(verse_number)
    end.join("\n")
  end

  def verse(number)
    verse_for(number).text
  end

  def verse_for(number)
    case number
    when 0 then Verse.new(number, &NoMore)
    when 1 then Verse.new(number, &LastOne)
    when 2 then Verse.new(number, &Penultimate)
    else        Verse.new(number, &Default)
    end
  end
end

class Verse
  attr_reader :number

  def initialize(number, &lyrics)
    @number = number
    @lyrics = lyrics
  end

  def text
    @lyrics.call(self)
  end
end

=begin
  Although the above code seems quite complicated, it made a better job than the
first attempt, since it is able to answer the first 3 questions:

  1. How many verse variants are there?
  There are four verse variants (they start on lines 2, 9, 16 and 23 above).

  2. Which verses are most alike? In what way?
  Verses 3-99 are most alike (as evidenced by the fact that all are produced
  by the Defaultvariant).

  3. Which verses are most different? In what way?
  Verses 0, 1 and 2 are clearly different from 3-99, although it’s not obvious
  in what way.

  4. What is the rule to determine which verse should be sung next?
  Buried deep within the NoMore lambda is a hard-coded "99," which might cause
  one to infer that verse 99 follows verse 0.

  This solution’s answers to the first three questions above are quite an
improvement over those of Incomprehensibly Concise. However, all is not perfect;
it still does poorly on the value/cost questions:

  1. How difficult was it to write?
  There’s far more code here than is needed to pass the tests. This unnecessary
  code took time to write.

  2. How hard is it to understand?
  The many levels of indirection are confusing. Their existence implies necessity,
  but you could study this code for a long time without discerning why they are needed.

  3. How expensive will it be to change?
  The mere fact that indirection exists suggests that it’s important. You may
  feel compelled to understand its purpose before making changes.

  Aside from the song and verses methods, the code does two basic things. First,
it defines templates for each kind of verse (lines 2-28), and second, it chooses
the appropriate template for a specific verse number and renders that verse’s
lyrics (lines 39-63).
  Notice that the verse templates contain all of the information needed to answer
the domain questions. There are four templates, and therefore, there must be four
verse variants. The Default template handles verses 3 through 99, so these verses
are clearly most alike. Verses 0, 1, and 2 have their own special templates,
so each must be unique. The four templates (if you ignore the fact that they’re
stored in lambdas are very straightforward, which makes answering the domain
questions easy.
  But it’s not the templates that are costly; it’s the code that chooses a template
and renders the lyrics for a verse. This choosing/rendering code is overly complicated,
and while complexity is not forbidden, it is required to pay its own way. In this
case, complexity does not. Instead of 1) defining a lambda to hold a template,
2) creating a new object to hold the lambda, and 3) invoking the lambda with self
as an argument, the code could merely have put each of the four templates into a
method and then used the case statement on lines 45-48 to invoke the correct one.
Neither the lambdas nor the Verse class are needed, and the route between them is
a series of pointless jumps through needless hoops.
  The code gives the impression that its author feared that the logic for selecting
or invoking a template would someday need to change, and so added levels of
indirection in a misguided attempt to protect against that day. They did not
succeed. Relative to the alternative, Listing 1.2: Speculatively General is harder
to understand without being easier to change. The additional complexity does not
pay off.
=end
