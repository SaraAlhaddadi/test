class Warehouse
  def info
    'this is Warehouse'
  end
end

class Payment
  def payment_types
    'we support 3 payment_types ....'
  end
end

class Facade
  attr_reader :warehouse, :payment
  def initialize
    @warehouse = Warehouse.new
    @payment = Payment.new
  end

  def help
    puts "FROM Payment system"
    puts payment.payment_types
    puts "FROM Warehouse system"
    puts warehouse.info
  end
end

cs = Facade.new
cs.help