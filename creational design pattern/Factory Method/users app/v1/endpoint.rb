require_relative './user.rb'
# the issue is in add new type of user and duplicate the code
class Endpoint
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def home
    user = if type == 'admin'
             Admin.new
           elsif type == 'member'
             Member.new
           else
             Guest.new
           end

    user.say
  end

  def content
    user = if type == 'admin'
             Admin.new
           elsif type == 'member'
             Member.new
           else
             Guest.new
           end

    user.say
  end
end

puts Endpoint.new('admin').home
puts Endpoint.new('member').content
