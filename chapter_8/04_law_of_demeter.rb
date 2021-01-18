=begin
  The dependency inversion left some violations behind. The code in verse method
violates the Law of Demeter that states:

  a) objects that are passed in as arguments to the method
  b) objects that are directly available to self

  💡 "Object may talk to its neighbors but not to its neighbor’s neighbors. Objects
     may only send messages to direct collaborators.

  Disrespecting that law produces code that is tightly coupled, have large contexts
and therefore is hard to reuse.
  Bottles knows too much about verse_template:

  * that verse_template responds to new
  * that new expects an argument
  * that the argument to new must be a number
  * that the object returned from new(number) responds to the message lyrics that
    lyrics returns the actual lyrics of interest
=end

class Bottles
  # [...]

  def verse(number)
    verse_template.new(number).lyrics
  end
end

class Foo
  def durability_of_preferred_toy_of_best_friends_pet
    best_friend.pet.preferred_toy.durability
  end
end

=begin
  The cure to Demeter violation is *message forwarding* (may be also called delegation,
they are similar, not the same). Demeter violation indicates a missing public
interface along the message chain. The code below implements that missing interface.
=end

class Friend
  def durability_of_preferred_toy_of_pet
  pet.durability_of_preferred_toy
  end
end

class Pet
  def durability_of_preferred_toy
    preferred_toy.durability
  end
end

class Toy
  def durability
    1.hour
  end
end

# Foo now only sends messages to best_friend
class Foo
  def durability_of_preferred_toy_of_best_friends_pet
    best_friend.durability_of_preferred_toy_of_pet
  end
end

=begin
  There are still improvements to do. The fixed violation left behind a method name:
durability_of_preferred_toy_of_best_friends_pet. This name reflects the prior structure
and couples the code to the current pet context. The method should be named after
the senders point of view.

  What does Foo want?
  It wants to know how long would a playdate last. In this context the playdate
lasts as long as the toy endures. Foo wants to know the playdate_time_limit.
=end

class Friend
  def playdate_time_limit
    pet.durability_of_preferred_toy
  end
end

class Foo
  def playdate_time_limit
    best_friend.playdate_time_limit
  end
end

=begin
  That name change has opened Foo to collaborate with other objects, like children.
=end

class FriendWithPet
  def playdate_time_limit
    pet.durability_of_preferred_toy
  end
end

class Pet
  def durability_of_preferred_toy
    preferred_toy.durability
  end
end

class Toy
  def durability
    3600
  end
end
class FriendWithChild
  def playdate_time_limit
    child.tolerance_for_social_contact
  end
end

class Child
  def tolerance_for_social_contact
    1800
  end
end

class Foo
  def playdate_time_limit
    best_friend.playdate_time_limit
  end
end

=begin
  LoD violations also implies that the chained methods return different types of
objects. It shouldn't be cofused with the code below. Although it chains methods,
every member of the chain returns a string and therefore LoD is not being violated
here.
=end

def prepare_string(string)
  string.chomp.gsub(' ', '-').capitalize
end
