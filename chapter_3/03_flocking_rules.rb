# Shameless Green
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

=begin
  *** Flocking Rules ***

    1) Select thing that are most alike
    2) Find the smallest difference between them
    3) Make the simplest that will remive that difference
      a) Parse the new code
      b) Parse and execute it
      c) Parse, execute and use its results
      d) Delete unused code

    * For now, change only one line at a time.
    * Run the tests after every change.
    * If the tests fail, undo and make a better change

> 💡 The focus here is encapsulating the concept that varies, a theme of many
design patterns. - Gang of Four

"Difference holds the key to understanding. If two concrete examples represent
the same abstraction and they contain a difference, that difference must represent
a smaller abstraction within the larger one. If you can name the difference,
you’ve identified that smaller abstraction." - Sandi Metz

  Goal: reduce the case statement to one line

  1. The firat step is to recognize things that are most alike and make them
  identical

  Verse two and the else branch are the most alike. The harded coded 2 and 1
clud easily be substituted for number and number - 1. The only real difference
between the two verses is the bottle/bottles on the last line.
=end

# Version 1
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

# Version 2
when 2
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} bottle of beer on the wall.\n"

else
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} bottles of beer on the wall.\n"

=begin
  The last two lines represent an smaller abstraction within the larger verse
abstraction. The goal os to name it, extract it to a method and substitute
bottle/bottles with a common message send. In order to do that, it's necessary
to find out what bottle/bottles represent in the context of the song.
  Right now the difference bottle/bottles and the new requirement six-pack are
concrete examples of the abstraction and shoul be named one level of abstraction
higher than the thing it represents. Some techniques may help recognizing it,
like listing the concrete examples on a table:

    | Number    |      ?     |
    | --------- | ---------- |
    | 1         | bottle     |
    | 6         | six-pack   |
    | n         | bottles    |

  If the concrete examples aren't enough to discover their category name, adding
other examples may help. Beer comes in bottles and six-packs. Wine comes in
carafes, juice in small boxes. So, what kind a thing is a bottle? It's a Container.
=end

# Version 2
def container(number)
  if number == 1
    "bottle"
  else
    "bottles"
  end
end

when 2
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} #{container(number - 1)} of beer on the wall.\n"

else
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} #{container(number - 1)} of beer on the wall.\n"

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

=begin
  The container abstraction made the 2 and else branches the same and therefore,
one of them may be deleted. The code above shows the before and after versions,
but skip the intermediate steps. Refactoring should be made one line at a time.
By following that rule the steps taken to achieve the last version were:

  1) create the container method
  2) return the string "bottles"
  3) call the method in the else branch
  4) add an optional parameter number
  5) add the conditional bottle/bottles according to the number param
  6) Add the parameter to the call of the method in the else branch
  7) call the method in the 2 branch
  8) delete two 2 branch

  Refactoring using this level of granularity makes errors easier to interpret
and the code remains functional through out the process
=end
