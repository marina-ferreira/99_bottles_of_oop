class Bottles
  def verse(n)
    sentence(n).capitalize + ", " +
    sentence(n, is_on_the_wall: false) + ".\n" +
    third_line(n) +
    sentence(n - 1, is_last: true) + ".\n"
  end

  def verses(upper, lower)
    upper.downto(lower).map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def sentence(n, is_last: false, is_on_the_wall: true)
    count(n) + bottles(n) + ' of beer' + on_the_wall(is_on_the_wall)
  end

  def count(n)
    n > 0 ? n.to_s : n == -1 ? 99.to_s : 'no more'
  end

  def bottles(n)
    ' bottle' + (singular?(n) ? '' : 's')
  end

  def singular?(n)
    n == 1
  end

  def on_the_wall(is_on_the_wall)
    is_on_the_wall ? ' on the wall' : ''
  end

  def how_many(n)
    singular?(n) ? 'it' : 'one'
  end

  def third_line(n)
    return 'Go to the store and buy some more, ' if n == 0
    "Take #{how_many(n)} down and pass it around, "
  end
end
