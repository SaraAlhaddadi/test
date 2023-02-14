require_relative './user'

class UserFactory
  def self.call(type)
    if type == 'admin'
      Admin.new
    elsif type == 'member'
      Member.new
    else
      Guest.new
    end
  end
end

class Endpoint
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def home
    user = UserFactory.call(type)
    user.say
  end

  def content
    user = UserFactory.call(type)
    user.say
  end
end

puts Endpoint.new('admin').home
puts Endpoint.new('member').content
