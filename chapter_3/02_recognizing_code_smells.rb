=begin
  The first thing to do when it's not so clear how to make the code open for the
new requirements, is to remove the code smells, one by one. If the smells are
hard to find start to look for things you dislike.
=end

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
  The most obvious code smells in the method above are:
    * Switch Statements smell (case)
    * Duplicated Code (duplicated strings in the branches of the case statement)

  The easier one to solve is the duplication one.

> 💡 "Refactoring is the process of changing a software system in such a way that
it does not alter the external behavior of the code yet improves its internal
structure. — Martin Fowler in Refactoring

  Tests will give you confidence to refactor and they should never change during
a refactoring. If tests break while you refactor there are two options:
    a) you have broken the code or
    b) the tests are flawed

  If the code rearrangement has not changed the behavior of the object, but its
tests start to fail, it means they are testing how things are done instead of what
the action accomplishes. The tests are coupled to the object's implementation,
they know too much. In this case, tests need to be improved before the refactor
can start.

  Each of the four branches in the case statement holds a verse variant, which is
an abstraction that is similar and different in ways not yet recognized. In case
an abstraction is hard to find, applying a set of rules may help find it:
=end
