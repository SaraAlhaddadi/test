class Shape
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def draw
    puts "draw with #{color.degree} pen"
  end
end

class Circle < Shape
  def draw
    puts "draw Circle with #{color.name}:#{color.degree} pen in"
  end
end

class Square < Shape
  def draw
    puts "draw Square with #{color.name}:#{color.degree} pen"
  end
end
