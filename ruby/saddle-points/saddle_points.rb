class Matrix

  def initialize(raw_matrix)
    @matrix = raw_matrix.each_line.map {|line| line.split.map(&:to_i) }
  end

  def rows
    matrix
  end

  def columns
    matrix.transpose
  end

  def saddle_points
    [*0...rows.size].product([*0...columns.size]).select { |coords| saddle_point?(*coords) }
  end

private
  attr_reader :matrix

  def saddle_point?(row, col)
    rows[row][col] == rows[row].max && rows[row][col] == columns[col].min
  end
end
