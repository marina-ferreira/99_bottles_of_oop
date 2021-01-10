# Original Factory
def self.for(number)
  case number
  when 0
    BottleNumber0
  when 1
    BottleNumber1
  when 6
    BottleNumber6
  else
    BottleNumber
  end.new(number)
end

=begin
  Factories vary along these dimensions and each has its trade-offs:

    1. The factory can be open to new variants or closed.
    2. The logic that chooses a variant can be owned by the factory or by the variant.
    3. The factory can be responsible for knowing/figuring out which classes are eligible to be
       manufactured or the variants can volunteer themselves.
=end

#1 Open Factory
class BottleNumber
  def self.for
    begin
      const_get("BottleNumber#{number}")
    rescue NameError
      BottleNumber
    end.new(number)
  end
end

=begin
  The snippet above presents a factory that is open for extension. As long as the
name pattern is followed any new class in the hierarchy will be correctly picked
up without any change to the factory. Although this seems a great solution, this
implementation is troublesome:

  1. Classes names are not directly referenced anymore.
    a) It's harder to understand the code
    b) Searching for BottleNumber0 through the source code won't return anything.

  2. It ignores classes that don't follow the pattern
  3. The code uses an exception for flow control

  What should be taken under consideration to decide if this is a good implementation
is how often the factory will change. If it changes frequently and it needs updates
on every change, then the more complicated code and unreferenced class names may
be worthwhile. If not, then leaving it simpler makes more sense.
=end
