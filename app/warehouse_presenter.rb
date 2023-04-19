#   Input
#   Crate PP does not overlap with Crate QQ and Crate TT
#   Crate QQ overlaps with Crate TT
#     _______________
#   5|__|__|QQ|QQ|__|
#   4|__|__|QQ|QQ|__|
#   3|PP|PP|__|__|__|
#   2|PP|TT|TT|__|__|
#   1|__|TT|TT|__|__|
#     1  2  3  4  5
class WarehousePresenter
  SPACE = '  '.freeze
  EMPTY = '_'.freeze

  def initialize(matrix)
    @matrix = matrix
    @width = matrix.first.size
    @height = matrix.size
  end

  def draw
    draw_x_axis
    draw_content
    draw_x_axis_numbers
  end

  private

  # draw   _______________
  def draw_x_axis
    puts SPACE + EMPTY * 3 * @width
  end

  # draw 5|__|__|__|__|__|
  #      4|__|__|__|__|__|
  #      3|__|__|__|__|__|
  #      2|__|__|__|__|__|
  #      1|__|__|__|__|__|
  def draw_content
    matrix.each.with_index do |row, idx|
      print "#{format('%02d', @height - idx)}|"
      row.each do |item|
        char = item.nil? ? EMPTY : item
        print "#{char * 2}|"
      end
      print "\n"
    end
  end

  # draw   1  2  3  4  5
  def draw_x_axis_numbers
    puts SPACE + ' ' + (1..@width).to_a.join(SPACE)
  end

  attr_reader :matrix
end
