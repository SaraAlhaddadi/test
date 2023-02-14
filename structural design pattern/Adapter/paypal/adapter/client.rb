require_relative './paypal_adapter'
require_relative './master_card_lib_adapter'
require_relative '../user.rb'

class ClientApp
  def self.call(platform:, user:)
    platform.subscription(user)
    platform.register(user)
  end
end

ClientApp.call(platform: MasterCardLibAdapter, user: User.new)
ClientApp.call(platform: PaypalAdapter, user: User.new)
