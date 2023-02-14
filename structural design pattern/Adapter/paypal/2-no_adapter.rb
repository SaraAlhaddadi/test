require_relative './paypal_lib'
require_relative './master_card_lib'
require_relative './user'

class ClientApp
  def self.call(platform:, user:)
    if platform == :paypal_lib
      PaypalLib.subscription(email: user.email)
      PaypalLib.customer(f_name: user.f_name, l_name: user.l_name)
    elsif platform == :paypal_lib
      MasterCardLib.subscription(external_id: user.id)
      MasterCardLib.user(full_name: user.f_name + user.l_name)
    else
      raise 'Wrong Platform'
    end
  end
end

ClientApp.call(platform: :paypal_lib, user: User.new)
