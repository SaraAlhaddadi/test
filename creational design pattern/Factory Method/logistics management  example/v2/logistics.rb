# main creator interface
class Logistics
  def plan_delivery
    validate_payload
    deliver
  end

  def validate_payload
    true
  end

  def to
    'Yemen'
  end

  def deliver
    transport.deliver
  end

  def transport
    rasie NotImplementedError
  end
end
