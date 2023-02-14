class PaypalLib
  class << self
    def subscription(email:)
      puts "Creating subscription for #{email}"
    end

    def customer(f_name:, l_name:)
      puts "Creating customer for #{f_name} #{l_name}"
    end
  end
end
