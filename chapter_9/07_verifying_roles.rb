=begin
  The following test will verify if verse_template players correctly implement the
role, which in this case is to respond to the lyrics message.
  BottleVerse is the production object, so it must be tested for the correct
implementation of the interface. Although VerseFake, is only used for testing,
it is a player of the verse template role and therefore, must be tested for that
as well. This will force avery player to stay in sync with the api.
=end

module VerseRoleTest
  def test_plays_verse_role
    assert_respond_to @role_player, :lyrics
  end
end

class BottleVerseTest < Minitest::Test
  include VerseRoleTest

  def setup
    @role_player = BottleVerse
  end

  def test_verse_general_rule_upper_bound
    expected =
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, BottleVerse.lyrics(99)
  end

  # ...
end

class VerseFakeTest < Minitest::Test
  include VerseRoleTest

  def setup
    @role_player = VerseFake
  end
end
