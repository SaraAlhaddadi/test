class Node
  def initialize(name = nil)
    @name = name
    @members = []
  end

  def <<(member)
    @members << member
  end

  def remove(member)
    @members.remove(member)
  end

  def family?
    !@members.empty?
  end

  def name
    return @name unless family?

    @members.map(&:name).join(' > ')
  end
end

family_tree = Node.new
a = Node.new('a')
b = Node.new('b')
family1 = Node.new
family1 << a
family1 << (b)
c = Node.new('c')
family_tree << (c)
family_tree << (family1)

puts b.name
puts family1.name
puts family_tree.name
