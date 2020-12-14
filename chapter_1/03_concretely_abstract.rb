class Bottles
  def song
    verses(99, 0)
  end

  def verses(bottles_at_start, bottles_at_end)
    bottles_at_start.downto(bottles_at_end).map do |bottles|
      verse(bottles)
    end.join("\n")
  end

  def verse(bottles)
    Round.new(bottles).to_s
  end
end

class Round
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def to_s
    challenge + response
  end

  def challenge
    bottles_of_beer.capitalize + ' ' + on_wall + ', ' +
    bottles_of_beer + ".\n"
  end

  def response
    go_to_the_store_or_take_one_down + ', ' +
    bottles_of_beer + ' ' + on_wall + ".\n"
  end

  def bottles_of_beer
    "#{anglicized_bottle_count} #{pluralized_bottle_form} of #{beer}"
  end

  def beer
    'beer'
  end

  def on_wall
    'on the wall'
  end

  def pluralized_bottle_form
    last_beer? ? 'bottle' : 'bottles'
  end

  def anglicized_bottle_count
    all_out? ? 'no more' : bottles.to_s
  end


  def go_to_the_store_or_take_one_down
    if all_out?
      @bottles = 99
      buy_new_beer
    else
      lyrics = drink_beer
      @bottles -= 1
      lyrics
    end
  end

  def buy_new_beer
    'Go to the store and buy some more'
  end

  def drink_beer
    "Take #{it_or_one} down and pass it around"
  end

  def it_or_one
    last_beer? ? 'it' : 'one'
  end

  def all_out?
    bottles.zero?
  end

  def last_beer?
    bottles == 1
  end
end

=begin
  Although separating the logic in small methods may seem like a good idea. In
this case it did not help answering the domain questions:

  1. How many verse variants are there?
  It’s almost impossible to tell.
  2. Which verses are most alike? In what way?
  Ditto.
  3. Which verses are most different? In what way?
  Ditto.
  4. What is the rule to determine which verse should be sung next?
  Ditto.

  The value/cost questions didn't get much better answers:

  1. How difficult was it to write?
  Difficult. This clearly took a fair amount of thought and time.
  2. How hard is it to understand?
  The individual methods are easy to understand, but despite this, it’s tough
  to get a sense of the entire song. The parts don’t seem to add up to the whole.
  3. How expensive will it be to change?
  While changing the code inside any individual method is cheap, in many cases,
  one simple change will cascade and force many other changes.

  It’s obvious that the author of this code was committed to doing the right thing,
and that they carefully followed the Red, Green, Refactor style of writing code.
The various strings that make up the song are never repeated—it looks as though
these strings were refactored into separate methods at the first sign of
duplication.

  As in every technique, DRYing out code is not free.It adds a layer of indirection,
making it harder to understand the code. DRY only pays out if it reduces the cost
of change more than it increases the cost of understanding the code.

  In this case the design doesn't exaclly allows easy change. If for any reason,
beer had to change to 'Kool-Aid', the string would have to be changed in just one
place:

  def beer
    'Kool-Aid'
  end

  The fact that change is made in just one place, does not mean the code will make
sence. Although the code works, there are several methods, including the above,
that have names that are now confusing. In order to make sense again all of those
methods would have to be renamed and applyig change to many places to accommodate
change is not DRY.

  def bottles_of_beer
  def buy_new_beer
  def drink_beer
  def last_beer?

  The issue here is in the name of the methods. They reflected the current context,
but don't fit anywhere else. Those methods were named after what they do, instead of
what they mean (the concept they represent). The name *beer* represents the wrong abstraction.

 💡 Methods should be named after what they represent in the context of your domain.

  In this context what is beer? Beer is the beverage. As Kool-Aid as well.

*beverage* is a definition that sits at a higher level of abstraction. Changing the code now does not require cacading changes and it does not loose sense.

  def beverage
    'Kbeer'
  end

  def beverage
    'Kool-Aid'
  end

=end
