=begin
  The verse method is indeed violating LoD. The law states that an object should
send messages to direct objects only. The API that responds to new and the API that
responds to lyrics are different, therefore sending new to the class BottleVerse
and sending lyrics to the instance of BottleVerse are two completely different things.
  If an object is allowed to talk to direct objects only, then instead of the class
BottleVerse, an instance of that class should be injected. Unfortunately, in this
case that is not possible, since the class is instantiated with the number argument.
  By asking the method verse what does it want, the answer is: lyrics.

    verse_template.lyrics(number)

  The line above represents what verse wants. And should be added to the BottleVerse
public interface.
  Once added the class method lyrics to BottleVerse, the verse method in Bottles
now holds the player of a role rather than a class, which decouples code.
=end

class Bottles
  # [...]

  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def verse(number)
    verse_template.lyrics(number)
  end
end

class BottlesVerse
  def self.lyrics(number)
    new(number).lyrics
  end
end

=begin
  Since LoD violations can be fixed with class methods, the idea of placing all
the behavior in the class level and never even instantiating BottleVerse at all.
That;'s not a good path, class methods resist refactoring, so putting domain
behavior on the class is a bet that that data it depends on won't vary in the
future. This may have a high cost down the line, so the best plan is always to
create instances of objects.
=end
