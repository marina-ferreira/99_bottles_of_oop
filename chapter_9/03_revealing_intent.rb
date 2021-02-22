=begin
  The BottleVerseTest now holds the tests for single verses lyrics. Although the
code is indeed more organized, those tests aren't still telling the right story.
The methods names as they are right now are misleading. test_the_first_verse
and test_another_verse tell the reader that there is something in common with
those tests, but it does not explicitly tell you what that is.
  Those tests names should hint the following:

  * this is a verse test
  * a rule exists
  * it applies to most verses
  * it involves a range
  * one test is for the upper bound
  * the other test is for the lower bound

  So names like test_verse_general_rule_upper_bound and
test_verse_general_rule_lower_bound sound like reasonable names.

  In addition, the tests also imply that some verses follow a common rule and
others do not. And the ones that don't have their own test. Right now, verses 6
and 7 are special verses, but don't have a test of their own. In order to keep
the consistency on the special cases the tests for verses 6 and 7 can be extracted
from the song test.
=end

class BottleVerseTest < Minitest::Test
  def test_verse_general_rule_upper_bound
    expected =
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(99)
  end

  def test_verse_general_rule_lower_bound
    expected =
      "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(3)
  end

  def test_verse_7
    expected =
      "7 bottles of beer on the wall, " +
      "7 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 six-pack of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(7)
  end

  def test_verse_6
    expected =
      "1 six-pack of beer on the wall, " +
      "1 six-pack of beer.\n" +
      "Take one down and pass it around, " +
      "5 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(6)
  end

  def test_verse_2
    expected =
      "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(2)
  end

  def test_verse_1
    expected =
      "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
     assert_equal expected, BottleVerse.lyrics(1)
  end

  def test_verse_0
    expected =
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(0)
  end
end
