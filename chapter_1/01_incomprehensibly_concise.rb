class Bottles
  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map { |n| verse(n) }.join("\n")
  end

  def verse(n)
    "#{n == 0 ? 'No more' : n} bottle#{'s' if n != 1}" +
    " of beer on the wall, " +
    "#{n == 0 ? 'no more' : n} bottle#{'s' if n != 1} of beer.\n" +
    "#{n > 0  ? "Take #{n > 1 ? 'one' : 'it'} down and pass it around"
              : "Go to the store and buy some more"}, " +
    "#{n-1 < 0 ? 99 : n-1 == 0 ? 'no more' : n-1} bottle#{'s' if n-1 != 1}"+
    " of beer on the wall.\n"
  end
end

=begin
  Imagine a continuum with "most concrete" at one end and "most abstract" at
the other. Code at the concrete end might be expressed as a single long
procedure full of if statements. Code at the abstract end might consist of many
classes, each with one method containing a single line of code.
  The best solution for most problems lies not at the extremes of this continuum,
but somewhere in the middle. There’s a sweet spot that represents the perfect
compromise between comprehension and changeability, and it’s your job as a
programmer to find it.

  This first solution embeds a great deal of logic into the verse string. This
code is hard to understand because it is inconsistent and duplicative, and because
it contains hidden concepts that it does not name.

  *** Consistency ***

  The style of the conditionals is inconsistent. Most use the ternary form (1).
Other statements are made conditional by adding a trailing if (2). Finally,
there’s the ternary within a ternary, which is best left without comment.

  (1) n == 0 ? 'No more' : n
  (2) 's' if n != 1
  (3) n-1 < 0 ? 99 : n-1 == 0 ? 'no more' : n-1

  Every time the style of the conditionals changes, the reader has to press a
mental reset button and start thinking anew. Inconsistent styling makes code
harder for humans to parse; it raises costs without providing benefits.

 *** Duplication ***

  The code duplicates both data and logic. For example, "bottle" pluralization
is done in three places. The code to do this is identical in two of the places,
on Lines 11 and 13 (1). But later, on line 16, the pluralization logic is subtly
different. Suddenly it’s not n that matters, but n-1.

(1) 's' if n != 1
(2) 's' if n-1 != 1

  Duplication of logic suggests that there are concepts hidden in the code that
are not yet visible because they haven’t been isolated and named. The need to
sometimes say "bottle" and other times say "bottles" means something, and the
need to sometimes use n and other times use n-1 means something else. The code
gives no clue about what these meanings might be.

  *** Names ***

  The most obvious point to be made about the names in the verse method is that
there aren’t any. The verse string contains embedded logic. Each bit of logic
serves some purpose, and it is up to you to construct a mental map of what these
purposes might be. The logic that’s hidden inside the verse string should be
dispersed into methods, and verse should fill itself with values by sending messages.

  Independent of all judgment about how well a bit of code is arranged, code is
also charged with doing what it’s supposed to do now as well as being easy to
alter so that it can do more later. While it’s difficult to get exact figures
for value and cost, asking the following questions will give you insight into the
potential expense of a bit of code.

  1. How difficult was it to write?
  2. How hard is it to understand?
  3. How expensive will it be to change?

Code is easy to understand when it clearly reflects the problem it’s solving,
and thus *openly exposes that problem’s domain*. If the code openly exposed the "99
Bottles" domain, a brief glance at the code would answer these questions:

  1. How many verse variants are there?
  2. Which verses are most alike? In what way?
  3. Which verses are most different, and in what way?
  4. What is the rule to determine which verse comes next?

  These questions reflect core concepts of the problem, yet none of their answers
are apparent in this solution. The number of variants, the difference between the
variants, and the algorithm for looping are distressingly obscure. This code
does not reflect its domain, and therefore you can infer that it was difficult
to write and will be a challenge to change. If you had to characterize the goal
of the writer of Listing 1.1: Incomprehensibly Concise, you might suggest that
their highest priority was brevity. Brevity may be the soul of wit, but it
quickly becomes tedious in code.
=end
