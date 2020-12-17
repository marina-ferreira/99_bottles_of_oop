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
    when 6
      "1 six-pack of beer on the wall, " +
      "1 six-pack of beer.\n" +
      "Take one down and pass it around, " +
      "5 bottles of beer on the wall.\n"
    when 7
      "7 bottles of beer on the wall, " +
      "7 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 six-pack of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{number - 1} bottles of beer on the wall.\n"
    end
  end
end

=begin
  The snippet above demonstrates the implementation for the new requirement
following the same logic applied so far. Unfortunately, the addition of another
two branches on the case statement has taken the code to a point that this design
is no longer acceptable and the cde has to be refactored.

  Before jumping into the refactoring, the code should be ready to receive that
addition, meaning the code has to be open for the new requirement. The Open/Closed
principle (the O in SOLID) states that objects should be open for extension and
closed for modification. Code is open to a new requirement when you can meet
that new requirement without changing existing code.

  In case the code is not open for modification, first the code needs to be
refactored to become open to receive the new requirement by the addition of
new code. The processes of refactoring and implementation of the new requirement
should not overlap. Refactoring first and then addition.

    In order to know where does your code stands right now the following chart
should be used:

          +-------------+                      +--------------+
          |             | Yes                  |   Make the   |
--------->| is it open? |--------------------->|    change    |
|         |             |              ^       +--------------+
|         +------+------+              |
|                | No                  |
|                |                     |
|                v                     |
|        +---------------+             |
|        |  Do you know  | Yes  +------------+
|        |  how to make  |----->|  Make it   |
|        |   it open?    |      |    open    |
|        +---------------+      +------------+
|                | No
|                |
|                v
|        +-------+---------+
|        | Remove the      |
---------| easiest to fix/ |
         | best understood |
         | code smell      |
         +-----------------+
=end



