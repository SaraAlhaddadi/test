class City
  include Enumerable
  attr_reader :streets, :name

  def initialize(name)
    @name = name
    @streets = []
  end

  def each(&block)
    streets.each(&block)
  end

  def <<(street)
    @streets << street
  end

  def reverse
    streets.reverse
  end
end

class Street
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Iterator
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def route
    raise NotImplementedError
  end
end

class MySelf < Iterator
  def route
    collection.reverse.map(&:name)
  end
end

class App < Iterator
  def route
    collection.sort_by { |element| element.name }.map(&:name)
  end
end

class Guide < Iterator
  def route
    collection.sort_by { |element| element.name }.map { |element| "the story of the #{element.name}" }
  end
end

city = City.new('Mukalla')
city << Street.new('ST3')
city << Street.new('ST1')
city << Street.new('ST2')

[MySelf, App, Guide].each do |element|
  puts "using #{element}"
  puts element.new(city).route
end
