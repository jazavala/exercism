class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words
      .group_by(&:itself)
      .transform_values(&:count)
  end

private
  attr_reader :phrase

  def words
    @words ||= phrase.downcase.scan(/\b[\w']+\b/)
  end
end
