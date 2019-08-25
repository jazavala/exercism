class Transpose

  def self.transpose(phrase)
    Transpose.new(phrase).output
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def output
    words.map { |line| line.ljust(width).chars }
      .transpose
      .map(&:join)
      .join("\n").strip
  end

  def words
    @words ||= phrase.split("\n")
  end

  def width
    @width ||= words.map(&:size).max
  end

private
  attr_reader :phrase
end
