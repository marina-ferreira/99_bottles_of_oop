def verse(number)
  bottle_number = BottleNumber.new(number)
  next_bottle_number = BottleNumber.new(bottle_number.successor)

  "#{bottle_number} of beer on the wall, ".capitalize +
  "#{bottle_number} of beer.\n" +
  "#{bottle_number.action}, " +
  "#{next_bottle_number} of beer on the wall.\n"
end

=begin
  By inspecting the above method its possible to see the that quantity and container
are always called together, on lines 5, 6, and 8. If these two things always
appear together, it’s a signal that this pairing represents a deeper concept and
that concept should be named.

  💡 "Data Clump is defined as the situation in which several (three or more)
data fields routinely occur together." - Sandi Metz
=end

class BottleNumber
  # [...]

  def to_s
    "#{quantity} #{container}"
  end
end
