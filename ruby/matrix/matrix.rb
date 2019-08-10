class Matrix
  def initialize(raw_matrix)
    @raw_matrix = raw_matrix
  end

  def rows
    @rows ||= @raw_matrix.each_line.map {|line| line.split.map(&:to_i) }
  end

  def columns
    columns ||= rows.transpose
  end
end
