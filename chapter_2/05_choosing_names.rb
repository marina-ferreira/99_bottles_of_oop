def song
  verses(99,0)
end

=begin
  The next method to be implemented is `song`. The fisrt thing that comes to mind
is: is it really necessary, since verse is already able to return the entire song?
The answer is Yes!. From the point of view of the sender, in order to produce the
whole song through `verses` by invoking `verses(99,0)` the sender has to know:

  * the name of the verses method
  * that the method requires two arguments
  * that the first argument is the verse on which to start
  * that the second argument is the verse on which to end
  * that the song starts on verse 99
  * that the song ends on verse 0

  Each piece of information that an object has to know about another object in
order to send a message is a dependency. Dependencies couples objects making them
less reusable and changeable.
  When the song method is created the number of dependencies drops to one, knowing
the name of the method.
=end
