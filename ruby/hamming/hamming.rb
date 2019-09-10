class Hamming
  class SequencesDifferentlengthError < ArgumentError
    def initialize(msg = "It isn\'t possible to calculate the Hamming distance because the sequences doesn\'t equals")
      super(msg)
    end
  end

  def self.compute(strand1, strand2)
    raise SequencesDifferentlengthError.new unless strand1.size == strand2.size

    strand1.chars.zip(strand2.chars).count {|nucleotide_a, nucleotide_b| nucleotide_a != nucleotide_b }
  end
end

if $PROGRAM_NAME == __FILE__
  puts Hamming.compute('a', 'ab')
end
