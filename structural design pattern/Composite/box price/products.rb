# component
class Product
  def price
    raise NotImplementedError
  end
end

class Toy < Product
  def price
    10
  end
end

class Pencil < Product
  def price
    2
  end
end

class Bag < Product
  def price
    15
  end
end

class Box < Product
  def initialize
    super
    @products = []
  end

  def add(product)
    @products << product
  end

  def remove(product)
    @products.remove(product)
  end

  def price
    @products.sum(&:price)
  end
end
