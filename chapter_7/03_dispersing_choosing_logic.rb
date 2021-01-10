=begin
  It makes sense to group the data/choosing logic inside the factory when both
are simple. Sometimes the choosing logic may be quite long and/or be linked to
logic in the object itself. In this case, it should live in the classes being chosen.
  The cons on that strategy are:

  1. The factory is closed
  If a new bottle number class comes along, it's necessary to add it to the list.

  2. The order of the classes in the list matter
  BottleNumber handles? will always return true and therefor new classes ought to
  be added in front of it. Any classes pushed to the end of the array will never
  get tested.
=end

class BottleNumber
  # [...]

  def self.for(number)
    [BottleNumber6, BottleNumber1, BottleNumber0, BottleNumber]
    .find { |candidate| candidate.handles?(number) }.new(number)
  end

  def self.handles?(number)
    true
  end
end

class BottleNumber0 < BottleNumber
  # [...]

  def self.handles?(number)
    number == 0
  end
end

class BottleNumber1 < BottleNumber
  # [...]

  def self.handles?(number)
    number == 1
  end
end

class BottleNumber6 < BottleNumber
  # [...]

  def self.handles?(number)
    number == 6
  end
end
