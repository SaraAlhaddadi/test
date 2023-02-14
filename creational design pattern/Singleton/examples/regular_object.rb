class RegularObject
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

puts RegularObject.new('sara').name
puts RegularObject.new('hi').name

class SingletonObject
  attr_reader :name

  private_class_method :new

  def initialize(name)
    @name = name
  end

  def self.instance(name)
    @instance ||= new(name)
  end
end

puts SingletonObject.instance('sara').name
puts SingletonObject.instance('hi').name
