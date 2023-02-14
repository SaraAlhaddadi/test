class User
  attr_reader :id, :f_name, :l_name ,:email

  def initialize
    @id = 1
    @f_name = "Sara"
    @l_name = "KH"
    @email = "test@gmail.com"
  end
end