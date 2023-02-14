require_relative './paypal_lib.rb'
require_relative './user'

class ClientApp
  def self.call(user:)
    PaypalLib.subscription(email: user.email)
    PaypalLib.customer(f_name: user.f_name, l_name: user.l_name)
  end
end

ClientApp.call(User.new)
