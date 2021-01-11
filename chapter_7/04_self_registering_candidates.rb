=begin
  Last section dispersed the choosing logic in the objects being chosen, but the
factory is closed. Class name candidates are explicitly declared in the list being
iterated. In case a new class comes along, the list has to be updated.

  def self.for(number)
    [BottleNumber6, BottleNumber1, BottleNumber0, BottleNumber]
    .find { |candidate| candidate.handles?(number) }.new(number)
  end

  There are two options for opening the factory

  1. The factory could dynamically figure out which classes belong on its list
  This sometimes may not be possible, since the object has to allow the factory
  a way to identify them.

  2. classes who want to be on the list could explicitly ask the factory to put
  them there.
  This options is always possible. If candidates agree to depend on knowing the
  name of the factory, they can add themselves to the list.

  BottleNumber declares a
    a) a list of candidates (registry)
    b) a method to allow them to enter the list

  All candidates then call the register method with self as an argument.

  The following line may also be replaced by a simpler version:

  - BottleNumber.register(self)
  + register(self)

  The first line depends explicitly on the class name, so at first glance it might
not seem like the best choice. Although the second line appears safer, it does
depend on something a bit less obvious: inheritance. By omitting the class name,
it's expected that the message register may be understood by someone in the
hierarchy. If for any reason the inheritance structure gets removed the
register(self) will have to be updated.
  So what option is best? The one that depends on the most stable thing. What is
more stable in the structure?

  1. the factory class name, or
  2. inheritance structure

  The factory is now open and is able to manufacture objects without actually
having the knowledge of their names.
=end

# Self Resgistering
class BottleNumber
  # [...]

  def self.registry
    @registry ||= []
  end

  def self.register(candidate)
    registry.prepend(candidate)
  end

  def self.for(number)
    registry.find { |candidate| candidate.handles?(number) }.new(number)
  end

  BottleNumber.register(self)
end

class BottleNumber0 < BottleNumber
  BottleNumber.register(self)

  # [...]
end

class BottleNumber1 < BottleNumber
  BottleNumber.register(self)

  # [...]
end
class BottleNumber6 < BottleNumber
  BottleNumber.register(self)

  # [...]
end
