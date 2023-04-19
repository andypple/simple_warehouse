class Crate
  attr_reader :x, :y, :w, :h, :code

  def initialize(position_x, position_y, width, height, code)
    @x = position_x
    @y = position_y
    @w = width
    @h = height
    @code = code
  end

  def overlap?(other)
    x_projection_overlap?(other.x, other.w) &&
      y_projection_overlap?(other.y, other.h)
  end

  def contain?(x1, y1)
    x <= x1 && x1 <= x + h &&
      y <= y1 && y1 <= y + h
  end

  private

  def x_projection_overlap?(x1, x1_width)
    [x, x1].max < [x + w, x1 + x1_width].min
  end

  def y_projection_overlap?(y1, y1_height)
    [y, y1].max < [y + h, y1 + y1_height].min
  end
end
