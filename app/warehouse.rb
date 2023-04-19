require_relative './warehouse_presenter'
require_relative './crate'

class Warehouse
  attr_reader :width, :height

  def init(width, height)
    @width = width.to_i
    @height = height.to_i
    @crates = []
  end

  def view
    WarehousePresenter.new(matrix).draw unless width.nil? && height.nil?
  end

  def store(x, y, w, h, code)
    x, y, w, h = [x.to_i, y.to_i, w.to_i, h.to_i]
    puts 'position does not exist' or return if invalid_position?(x, y)
    puts 'crate does not fit' or return if overlap_bourdary?(x, y, w, h)

    new_crate = Crate.new(x, y, w, h, code)
    puts 'crate does not fit' or return if overlap_crates?(new_crate)

    @crates << new_crate
  end

  def locate(code)
    return if width.nil? && height.nil?

    result = @crates.select { _1.code == code }
    WarehousePresenter.new(matrix(result.map(&:code))).draw
    @crates.select { _1.code == code }
  end

  def remove(x, y)
    return if width.nil? && height.nil?

    x, y = [x.to_i, y.to_i]
    unless @crates.reject! { _1.contain?(x, y) }
      puts 'Crate does not exist'
    end
    @crates
  end

  private

  def invalid_position?(x, y)
    x > width || y > height
  end

  def overlap_bourdary?(x, y, w, h)
    x + w - 1 > width || y + h - 1 > height
  end

  def overlap_crates?(other)
    @crates.any? { _1.overlap?(other) }
  end

  def matrix(filter_codes = :all)
    data = Array.new(height) { Array.new(width) }

    @crates.each do |crate|
      (crate.x..(crate.x + crate.w - 1)).each do |x|
        (crate.y..(crate.y + crate.h - 1)).each do |y|
          next unless filter_codes == :all || filter_codes.include?(crate.code)

          data[height - y][x - 1] = crate.code
        end
      end
    end

    data
  end
end
