require 'pry'
class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @all_sides = [@side_1, @side_2, @side_3].sort
  end


  def kind
    if real_triangle
      begin
        raise TriangleError
      end
    end
    # :equilateral - 3 equal sides - check to see if side 1 = side 2, and if side 2 = side 3
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    # :isosceles - if side 1 = side 2 OR if side 1 = side 3 OR if side 2 = side 3
    elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
      :isosceles
    # :scalene
    else
      :scalene
    end
  end


  def real_triangle
    self.all_sides.any? do | side | 
      binding.pry
      side < 0 || all_sides[0] + all_sides[1] <= all_sides[2] 
    end
  end


  class TriangleError < StandardError
  end
end