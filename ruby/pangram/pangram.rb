class Pangram

 SEARCH_DIMENSION = ('a'..'z').freeze

  def self.pangram?(text)
    (SEARCH_DIMENSION.to_a - text.downcase.chars).blank?
  end
end
