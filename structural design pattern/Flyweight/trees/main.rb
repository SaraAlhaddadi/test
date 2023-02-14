require 'byebug'
class Tree
  attr_reader :location, :height, :type

  def initialize(location, height, type)
    @location = location
    @height = height
    @type = type
  end

  def me
    "I am #{type.name} #{type.color} tree with #{type.texture},\n in #{@location} with #{@height} heigth"
  end
end

class TreeType
  attr_reader :name, :color, :texture

  def initialize(name, color, texture)
    @name = name
    @color = color
    @texture = texture
  end
end

class TreeTypeFactory
  @@tree_types = {}

  def self.get_type(name, color, texture)
    @@tree_types[key(name, color,
                     texture)] || @@tree_types[key(name, color, texture)] = TreeType.new(name, color, texture)
  end

  def self.tree_types
    @@tree_types.keys
  end

  def self.key(*attr)
    attr.sort.join('_').to_sym
  end
end

def create_tree(name, color, texture, location, height)
  type = TreeTypeFactory.get_type(name, color, texture)
  Tree.new(location, height, type)
end

tree1 = create_tree('apple', 'green', 'wood', 'yemen', 10)
tree2 = create_tree('apple', 'green', 'wood', 'aden', 20)

puts tree1.me
puts tree2.me

p TreeTypeFactory.tree_types
