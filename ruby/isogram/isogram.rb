class Isogram

  def self.isogram?(input)
    new(input).isogram?
  end

private
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def words
    @words ||= input.downcase.scan(/\p{letter}/)
  end

public
  def isogram?
    words.size == words.uniq.size
  end
end
