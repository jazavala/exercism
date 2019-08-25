class Anagram
  def initialize(word)
    @word = word
  end

  def match(anagrams)
    anagrams.select do |anagram|
      !word.casecmp?(anagram) && word.downcase.chars.sort == anagram.downcase.chars.sort
    end
  end

private
  attr_reader :word
end
