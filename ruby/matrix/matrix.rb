class Matrix
  attr_reader :rows, :columns

  def initialize(raw_matrix)
    @rows = raw_matrix.each_line.map {|line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end
end
