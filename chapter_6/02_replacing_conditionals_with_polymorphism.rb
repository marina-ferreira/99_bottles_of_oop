class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def quantity
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def successor
    if number == 0
      99
    else
      number - 1
    end
  end

  def to_s
    "#{quantity} #{container}"
  end
end

=begin
  Until now quite an improvement has been made, code smells have been removed and
the overall code is much more organized. But the methods that didn't follow the
OO approch remain in its place. Now instead of testing an argument, they test a
message send, but other then that they are not much different from when they lived
under Bottles class.
  Most of BottleNumber methods have conditions, which define the Switch Statement
code smell. There are several recipes to cure that smell:

  1. Replace Conditional with State/Strategy
    Uses composition to disperse conditions branches into smaller objects,
    selected and plugged back in at runtime.

  2. Replace Conditional with Polymorphism
    Uses inheritance to create a superclass that holds the default (false branch)
    and adds subclasses for the true branches, also selected and plugged back in
    at runtime.

  🤣 "It’s now time for the object-oriented miracle that turns condition-laden
  classes into sets of independent objects." - Sandi Metz
=end

class BottleNumber
  # ...
  def quantity
    if number == 0
    # ...
  def container
    if number == 1
    # ...
  def action
    if number == 0
    # ...
  def pronoun
    if number == 1
    # ...
  def successor
    if number == 0
    # ...
end

=begin
  If the conditionals are inspected closely, it's possible to see that they obsess
on Integers 0 and 1. If only the false branch is left in those methods, they would
work for every verse, except 0 and 1. That means that 0 and 1 are smater numbers
and therefore, require an specialization. As it was already mentioned, Primitive
Obsession is cured by Extract Class.

  The Replace Conditional with Polymorphism is applied by

    1. Choose the value being explicitly tested in the conditional
      Let's go with 0.

    2. Choose a name for the new class
      BottleNumber0

    3. Create an empty subclass that inherits from BottleNumber
    4. Copy the methods that obsess on 0 to BottleNumber0

      class BottleNumber0 < BottleNumber
        def quantity
          if number == 0
            "no more"
          else
            number.to_s
          end
        end
      end

    5. Delete the part of the method that is not about 0 (the else branch)
=end

class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end
end
