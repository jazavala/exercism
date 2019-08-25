class Series

  def initialize(digits)
    @digits = digits.chars
  end

  def slices(length)
    raise ArgumentError unless length <= digits.length

    digits.each_cons(length).map(&:join)
  end

private
  attr_reader :digits
end
