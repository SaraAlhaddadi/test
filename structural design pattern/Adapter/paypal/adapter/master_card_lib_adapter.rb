require_relative '../master_card_lib'

class MasterCardLibAdapter
  class << self
    def subscription(user)
      MasterCardLib.subscription(external_id: user.id)
    end

    def register(user)
      MasterCardLib.user(full_name: user.f_name + user.l_name)
    end
  end
end
