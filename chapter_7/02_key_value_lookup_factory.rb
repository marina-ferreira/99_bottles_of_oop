#2 Key/Value Lookup Factory

# Version 1
class BottleNumber
  def self.for
    Hash.new(BottleNumber).merge({
      0: BottleNumber0,
      1: BottleNumber1,
      6: BottleNumber6,
    })[number].new(number)
  end
end

# Version 2
class BottleNumber
  def self.for
    {
      0: BottleNumber0,
      1: BottleNumber1,
      6: BottleNumber6
    }.fetch(number, BottleNumber).new(number)
  end
end

=begin
  The Key/Value Lookup factory is analogous to the original case statement in the
sense that it is not open, like #1 Open Factory. The benefits here are:

  1. Data has been separated from the choosing logic.
  That can be seen by taking a closer look on the color change difference of both
  factories. That case statement version changes colors constantly, the #2 Key/Value
  Lookup Factory does not. That means #2 Key/Value Lookup Factory has abstractions
  that are alike close together.

  2. Since data and logic are separated, data can be placed somewhere else.
  An external file, or even a database, which would allow for an interface for
  updating it as needed.

  Version 1 structure with Hash.new and a default only works when the creation,
default setting and lookup are executed from the same method. Any other case the
Version 2 with fetch structure would be a better choice.
=end
