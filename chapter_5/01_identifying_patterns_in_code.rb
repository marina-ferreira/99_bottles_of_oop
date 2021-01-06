class Bottles
  def song
    verses(99,0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def quantity(number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def successor(number)
    if number == 0
      99
    else
      number - 1
    end
  end
end

=begin
  In order to identify patterns in the code you can ask the following questions.

  * Bootle class

    1. Do any methods have the same shape?
    Yes, the Flocked Five methods.

    2. Do any methods take an argument of the same name?
    Yes, six methods take an argument named number

      1. verse(number)
      2. quantity(number)
      3. container(number)
      4. action(number)
      5. pronoun(number)
      6. successor(number)

    3. Do arguments of the same name always mean the same thing?
      In the verse method context number represents a verse number. In the context
      of flocked five number represents a bottle number.

    4. If you were to add the private keyword to this class, where would it go?
    After verse and before the flocked five methods.

    5. If you were going to break this class into two pieces, where’s the dividing line?
    Same as above.

  * Flocked Five (quantity, container, action, pronoun, successor)

    6. Do the tests in the conditionals have anything in common?
    All test number for equality with an exact number. Which makes the code more
    precise, easier to understand and refactor.

    7. How many branches do the conditionals have?
    Two.

    8. Do the methods contain any code other than the conditional?
    No. Which means they have a single responsability.

    9. Does each method depend more on the argument that got passed, or on the
    class as a whole?
    Depend only on the number argument.

    Those questions separate the methods into two groups:

      1. Flocked five are:
        * same-shaped
        * samekind-of-conditional-testing
        * bottle-number-taking
        * argument-depending

      2. song, verses, and verse methods
=end

def container(number)
  if number == 1
    "bottle"
  else
    "bottles"
  end
end

=begin
  If examined closely, any of the flocked five methods have a lot of non object
oriented behavior. They take an argument, test it and return behavior. The container
method knows what number is, knows specific values of it and what to do with each
of them. If anything changes, container will change along.

  💡 "As an OO practitioner, when you see a conditional, the hairs on your neck should
stand up. Its very presence ought to offend your sensibilities. You should feel
entitled to send  messages to objects, and look for a way to write code that allows
you to do so. The above pattern means that objects are missing, and suggests that
subsequent refactorings are needed to reveal them. Be on the lookout for this code
shape, as it implies that there’s more to be done." - Sandi Metz.

  💡 "Manageable OO applications consist of pools of small objects that collaborate
to accomplish tasks. [...] However, there’s a big difference between a conditional
that selects the correct object and one that supplies behavior. The first is
acceptable and generally unavoidable. The second suggests that you are missing
objects in your domain." - Sandi Metz.

  The container method should be changed to just send a message to another object
that will supply behavior.
=end

def container(smarter_number)
  smarter_number.container
end
