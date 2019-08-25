class SumOfMultiples

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    unique_multiples(limit-1).sum
  end

private

  attr_reader :divisors

  def unique_multiples(limit)
    divisors.map do |divisor|
      1.upto(limit).select { |dividend| (dividend % divisor).zero? }
    end.flatten.uniq
  end
end
