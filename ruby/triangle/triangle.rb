class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    triangle? && equal_sides == 3
  end

  def isosceles?
    triangle? && equal_sides >= 2
  end

  def scalene?
    triangle? && equal_sides == 1
  end

private

  def triangle?
    !invalid_side? && !inequality? && !degenerate?
  end

  def equal_sides
    @equal_sides ||= sides.group_by(&:itself).map { |k,v| [k, v.count] }.to_h.values.max
  end

  def invalid_side?
    sides.include?(0)
  end

  def inequality?
    sum_two_sides < last_side
  end

  def degenerate?
    sum_two_sides == last_side
  end

  def sum_two_sides
    @sum_two_sides ||= sides.min(2).reduce(:+)
  end

  def last_side
    @last_side ||= sides.max
  end
end
