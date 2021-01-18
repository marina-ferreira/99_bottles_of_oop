=begin
  The Bottles class is still not open for extension, the class has been extracted,
but the dependency has not yet been inverted. It explicitly calls BottleVerse
class, which makes both classes tightly coupled. in order to be able to collaborate
with other classes, that coupling must be loosened.
  The Dependency Inversion Principle or DIP, corresponds to D in the SOLID acronym
and means:

  💡 Depend on abstractions, not concretions.

  In this case, Bottles knows two things about BottleVerse:

  1. Concrete: it knows the name of the class BottleVerse
  2. Abstract: the duck responds to verse

  The second one is required. It's Bottles responsibility to know that the object
has a public interface that responds to verse. The first one though, is not
necessary and can be easily extracted.
  Using the wishful thinking strategy, the code below shows how that extraction
should go.
=end

# Step 1
class Bottles
  # [...]

  def verse(number)
    # verse_template.new(number).lyrics
    BottleVerse.new(number).lyrics
  end
end

# Step 2
class Bottles
  # [...]

  attr_reader :verse_template

  def initialize(verse_template: BottleVerse)
    @verse_template = verse_template
  end

  def verse(number)
    verse_template.new(number).lyrics
  end
end

=begin
  Coupling has been loosened and Bottles is now open for extension. Moreover, a
new role has been discovered: verse_template. Bottles is now *composed* of
verse templates.
  The process to produce verse template follows the idea:

  💡 "Isolate the behavior you want to vary" (Fundamental concept of OO)

  💡 "Isolating variants often requires that you invert dependencies, and an excellent
  technique for inverting dependencies is to inject them. This section isolated
  the BottleVerse variant and then inverted the dependency by injecting
  BottleVerse as a player of the verse template role."
=end
