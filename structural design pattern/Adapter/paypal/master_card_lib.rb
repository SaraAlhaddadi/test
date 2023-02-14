class MasterCardLib
  class << self
    def subscription(external_id:)
      puts "Creating subscription for external_id #{external_id}"
    end

    def user(full_name:)
      puts "Creating user as #{full_name}"
    end
  end
end
