class Shape
  def draw(visitor)
    raise NotImplementedError
  end

  def do_something_in_prod
    raise NotImplementedError
  end
end

class Dot < Shape
  def draw(visitor)
    visitor.draw_dot('Dots')
  end

  def do_something_in_prod
    puts 'I am busy Dot in prod!'
  end
end

class Circle < Shape
  def draw(visitor)
    visitor.draw_dot('Circle')
  end

  def do_something_in_prod
    puts 'I am so busy Circle in prod!'
  end
end

class Square < Shape
  def draw(visitor)
    visitor.draw_square
  end

  def do_something_in_prod
    puts 'I am so busy Square in prod! no one like me'
  end
end

class Visitor
  def draw_square
    puts 'good busy square'
  end

  def draw_dot(type)
    puts "good dot if it is a #{type}"
  end
end

visitor = Visitor.new

# let's visit the shapes and draw them

[Dot.new, Circle.new, Square.new].each do |shape|
  shape.do_something_in_prod
  shape.draw(visitor)
end
