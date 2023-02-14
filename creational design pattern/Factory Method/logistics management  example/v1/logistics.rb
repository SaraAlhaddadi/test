require_relative 'ship'
class Logistics
  def plan_delivery
    validate_payload
    deliver
  end

  def validate_payload
    true
  end

  def deliver
    Ship.new('Yemen').deliver
  end
end

l = Logistics.new
l.plan_delivery
