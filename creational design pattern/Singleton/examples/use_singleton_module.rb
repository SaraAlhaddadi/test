require 'singleton'
class SingletonObject
  include Singleton

  attr_accessor :name
  ## the Singleton module overrides the following code
  # @@instance = self.new
  #
  # def self.instance
  #   @@instance
  # end
  #
  # private_class_method :new
end

obj1 = SingletonObject.instance
obj1.name = "sara"
puts obj1.name

obj2 = SingletonObject.instance
obj2.name = "not sara"
puts obj2.name
puts obj1.name #not sara
