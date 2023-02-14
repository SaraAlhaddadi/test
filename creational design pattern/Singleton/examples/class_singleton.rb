class ClassSingleton
  class << self
    attr_accessor :name
  end

  private_class_method :new
end

ClassSingleton.name = "sara"
puts ClassSingleton.name
ClassSingleton.name = "sara1"
puts ClassSingleton.name
#private method `new' called
obj = ClassSingleton.new