class Human
  def warning
    'Skin'
  end
end

class Cloth
  attr_reader :human

  def initialize(human)
    @human = human
  end

  def warning
    human.warning
  end
end

class Sweater < Cloth
  def warning
    "Sweater > #{human.warning}"
  end
end

class Skirt < Cloth
  def warning
    "Skirt > #{human.warning}"
  end
end

puts Skirt.new(Sweater.new(Human.new)).warning
