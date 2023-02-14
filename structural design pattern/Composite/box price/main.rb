require_relative './products'

box1 = Box.new
toy = Toy.new
box1.add(toy)
box1.add(Bag.new)
box1.add(Pencil.new)

puts box1.price
puts toy.price

big_box = Box.new
big_box.add(box1)
big_box.add(Pencil.new)
big_box.add(Bag.new)
puts big_box.price
big_box.add(box1)
puts big_box.price
