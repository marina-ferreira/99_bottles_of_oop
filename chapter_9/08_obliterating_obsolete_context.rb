class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template: BottleVerse, max: 99, min: 0)
    @verse_template = verse_template
    @max, @min = max, min
  end

  # ...
end

=begin
  The defaults in the CountdownSong's initialize method are a vestige of the
99 Bottles context. The BottleVerse template may be removed, so the caller is
forced to provide one. That couldn't have been done before, because tests
were coupled to that default.
  For the boundaries, it feels natural to set min to 0, max on the other hand,
provides countless options. Setting it to a very high number exposes that the
class can handle a broad range, so 999999 seems like the way to go.
=end

class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template:, max: 999999, min: 0)
    @verse_template = verse_template
    @max, @min = max, min
  end

  # ...
end
