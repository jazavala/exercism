class Year
  LEAP = 4
  STANDARD_CENTURY = 100
  LEAP_CENTURY = 400

  def self.leap?(year)
    new.leap?(year)
  end

  def leap?(year)
    (year % LEAP).zero? && (year % STANDARD_CENTURY).nonzero? || (year % LEAP_CENTURY).zero?
  end
end
