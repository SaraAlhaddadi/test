require 'byebug'
class Handler
  attr_accessor :next_handler

  def handle(task)
    return execute(task) if can_handle?(task)

    next_handler&.handle(task)
  end

  def set_next_handler(next_handler)
    self.next_handler = next_handler
    next_handler
  end

  def can_handle?(task)
    raise NotImplementedError
  end
end

class Autoresponder < Handler
  def can_handle?(task)
    articles.include?(task)
  end

  def execute(task)
    puts "Hey! Take and Read article about #{task}"
  end

  def articles
    ['How to compute salary?', 'How to compute GOSI ?']
  end
end

class CustomerSupport < Handler
  def can_handle?(task)
    !backdoors.include?(task)
  end

  def execute(task)
    puts "I am a CS I will handle #{task}"
  end

  def backdoors
    ['reopen Payroll', 'reopen FS']
  end
end

class Developer < Handler
  def can_handle?(_task)
    true
  end

  def execute(task)
    puts "I am a Developer I will handle #{task}"
  end
end

autore_sponder = Autoresponder.new
cs = CustomerSupport.new
dev = Developer.new

autore_sponder.set_next_handler(cs).set_next_handler(dev)

def handle_tasks(handler)
  ['reopen Payroll', 'remove retroactive', 'How to compute salary?'].each do |task|
    handler.handle(task)
  end
end

handle_tasks(autore_sponder)
handle_tasks(cs)
