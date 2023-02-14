module SingletonModule
  class << self
    attr_accessor :name
  end
end

SingletonModule.name = "sara"
puts SingletonModule.name
SingletonModule.name = "sara1"
puts SingletonModule.name