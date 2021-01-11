=begin
  Instead of making the subclasses register themselves, its possible to auto
register them, as long as they follow an specific convention It may be an instance
variable, a method or a class name. In this case all player of the role are subclasses
of BottleNumber. If the inheritance hierarchy does not change, it's possible to
make use of a hook message called inherited. This message gets sent from the subclass
to the superclass and it's meant to be overridden.
=end

class BottleNumber
  # [...]

  def self.inherited(candidate)
    register(candidate)
  end
end

=begin
  With the above code in place the BottleNumber.register(self) may be removed
from all subclasses.
  The inherited hook does not get called for BottleNumber and it must register
itself. It's possible to either leave the BottleNumber.register(self) or add the
class name to the initialization of registry.
=end

class BottleNumber
  # [...]

  def self.registry
    @registry = ||= [BottleNumber]
  end
end
