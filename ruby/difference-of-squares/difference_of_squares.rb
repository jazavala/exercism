class Squares

  def initialize(number)
    @number = number
  end

  def square_of_sum
    @square_of_sum ||= range.sum.pow(2)
  end

  def sum_of_squares
    @sum_of_squares ||= range.sum { |square| square.pow(2) }
  end

  def difference
    square_of_sum - sum_of_squares
  end

private
  attr_reader :number

  def range
    @range = 1.upto(number)
  end
end
