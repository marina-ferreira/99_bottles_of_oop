class BottlesTest < Minitest::Test
  def test_the_first_verse
    expected =
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"

    assert_equal expected, Bottles.new.verse(99)
  end

  def test_another_verse
    expected =
      "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"

    assert_equal expected, Bottles.new.verse(3)
  end
end

# Version 1
def verse(number)
  if number == 99
    "99 bottles of beer on the wall, " +
    "99 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "98 bottles of beer on the wall.\n"
  else
    "3 bottles of beer on the wall, " +
    "3 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "2 bottles of beer on the wall.\n"
  end
end

# Version 2
def verse(number)
  if number == 99
    n = 99
  else
    n = 3
  end

  "#{n} bottles of beer on the wall, " +
  "#{n} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{n - 1} bottles of beer on the wall.\n"
end

# Version 3
def verse(number)
  "#{number} bottles of beer on the wall, " +
  "#{number} bottles of beer.\n" +
  "Take one down and pass it around, " +
  "#{number - 1} bottles of beer on the wall.\n"
end

=begin
  By trying to implement only the minimum amount of code needed to make the test
green, the first two tests lead us to the above solutions:

  * Version 1: you have to pass yout yese through the code to understand what is
  varying.

  * Version 2: it separates the code that changes from the one that does not,
  improving understandability. But if we stick to this pattern, from verses 99-3
  97 conditional braches will be needed, along with 97 tests. With this approach,
  as tests get more speific, the code gets equally more specific.

  * Version 3: it removes the conditional and generalizes the code as a result of
  the increase if specificity of the test. This solution definetely works for
  making the tests pass as fast as possible.

  | Version    | SLOC | Cyclomatic<br>Complexity | ABC    |
  | ---------  |:----:| ------------------------:| ------:|
  | 1          | 13   | 2                        | 2.2    |
  | 2          | 12   | 2                        | 2.8    |
  | 3          | 6    | 1                        |  1     |

  Cyclomatic Complexity decreases along with SLOC, but ABC get worse before it
gets better. The table shows that removing the duplication with an abstraction
(interpolation) is the way to go.
=end
