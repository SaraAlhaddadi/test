ConstantSingleton = Struct.new(:name)

MY_SINGLETON = ConstantSingleton.new('sara')

puts MY_SINGLETON.name
MY_SINGLETON.name = "123"
puts MY_SINGLETON.name
