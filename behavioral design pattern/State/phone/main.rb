class Smartphone
  attr_accessor :state

  def initialize
    @state = Locked.new(self)
  end

  def tap
    state.tap
  end

  def screen
    state.screen
  end

  def call
    state.call
  end

  def show_galley
    state.show_galley
  end

  def state_name
    state.name
  end
end

class State
  attr_reader :phone

  def initialize(phone)
    @phone = phone
  end

  def tap
    raise NotImplementedError
  end

  def screen
    raise NotImplementedError
  end

  def call
    raise NotImplementedError
  end

  def show_galley
    raise NotImplementedError
  end

  def name
    puts self.class.name
  end
end

class Locked < State
  def tap
    phone.state = Unlocked.new(phone)
  end

  def screen
    puts 'Locked screen'
  end

  def call
    puts 'You can call'
  end

  def show_galley
    puts 'You can not show_galley'
  end
end

class Unlocked < State
  def tap
    phone.state = Locked.new(phone)
  end

  def screen
    puts 'wallpaper screen'
  end

  def call
    puts 'You can call'
  end

  def show_galley
    puts 'You can show_galley'
  end
end

class Charge < State
  def tap
    puts 'battery screen'
  end

  def screen
    puts 'battery screen'
  end

  def call
    puts 'You can not call'
  end

  def show_galley
    puts 'You can not show_galley'
  end
end

def client_code(phone)
  puts '*' * 10
  phone.state_name
  puts '*' * 10

  phone.screen
  phone.call
  phone.tap
  phone.show_galley
end
phone = Smartphone.new

client_code phone
client_code phone

phone.state = Charge.new(phone)
client_code phone
