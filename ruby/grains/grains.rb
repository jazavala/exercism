module GrainsErrors
  class InvalidSquareError < ArgumentError
    def initialize(message = 'The number in board must be 1 between 64')
      super
    end
  end
end

class Grains
  extend GrainsErrors

  BASE = 2
  TOTAL_SQUARES = 64
  MIN_SQUARE = 1

  class << self
    def square(number_square)
      raise InvalidSquareError if number_square < MIN_SQUARE || number_square > TOTAL_SQUARES

      BASE.pow(number_square - 1)
    end

    def total
      BASE.pow(TOTAL_SQUARES) - MIN_SQUARE
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts Grains.square(0)
end
