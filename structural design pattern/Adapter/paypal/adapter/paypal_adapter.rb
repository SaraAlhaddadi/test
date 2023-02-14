require_relative '../paypal_lib'

class PaypalAdapter
  class << self
    def subscription(user)
      PaypalLib.subscription(email: user.email)
    end

    def register(user)
      PaypalLib.customer(f_name: user.f_name, l_name: user.l_name)
    end
  end
end
