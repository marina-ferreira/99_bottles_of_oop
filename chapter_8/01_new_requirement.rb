=begin
  And yet, a new requirement comes in: Your customer wants other songs that are
similar to "99 Bottles" but contain different lyrics. The the Open-Closed
Flowchart most times clarifies what do do next.

  1. Is the code open to the vary the verses requirement? No.
  2. Do you know how to make it open? Probably not.
  3. What’s the best-understood code smell?
    While it’s clear that the verse method might be doing too much, it’s not
    clear how identifying and fixing any currently-existing code smell will help.

  But not in this case. When that happens, writing pseudocode with a conditional
may help with the general view of the problem.

=end

def verse(number)
  # if 99_bottles_song
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  # elsif unknown_song_2_verse
    # ...
    # assemble verse for unknown song 2
    # ...
  # elsif unknown_song_3_verse
    # ...
    # assemble verse for unknown song 3
    # ...
  # end
end

=begin
  With the addition of the conditionals now there are two obvious code smells,
Switch Statement and Long Function. The latter happens because of the first, so
it will be ignored by now. The cure to Switch Statement is Extract Class:

  1. Choose a class name and create the new class.
  2. Add an attr_reader and an initialize method to encapsulate primitive data.
  Copy the methods from the old class to the new.
  3. Forward messages from the old class to the new.
  4. One by one, remove arguments from the methods in the new class, and
  corresponding parameters from the message sends in the old class.
=end

class BottleVerse
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def verse
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class Bottles
  # [...]

  def verse(number)
    BottleVerse.new(number).verse
  end
end
