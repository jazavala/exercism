class Complement
  NUCLEOTIDES_COMPLEMENT = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
  }.freeze

  #DNA = NUCLEOTIDES_COMPLEMENT.keys.join
  #RNA = NUCLEOTIDES_COMPLEMENT.values.join

  def self.of_dna(secuence_of_nucleotides)
    secuence_of_nucleotides.gsub(/./, NUCLEOTIDES_COMPLEMENT)

    # using tn
    #secuence_of_nucleotides.tr(DNA, RNA)

    #using map and loops
    #secuence_of_nucleotides.chars.map do |nucleotide|
    #  NUCLEOTIDES_COMPLEMENT[nucleotide]
    #end.join('')
  end
end
