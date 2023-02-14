class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise NotImplementedError
  end
end

class SaveCommand < Command
  def initialize(target)
    super("I will save to #{target}")
  end

  def execute
    puts description
  end
end

class Button
  def initialize(command)
    @command = command
  end

  def on_click
    puts 'by Button'
    @command.execute
  end
end

class Shortcut
  def initialize(command)
    @command = command
  end

  def invoke
    puts 'by Shortcut'
    @command.execute
  end
end

save = SaveCommand.new('this file')
save_button = Button.new(save)
save_button.on_click

save_shortcut = Shortcut.new(save)
save_shortcut.invoke

# ---------------------
# with proc or lamda
class Shortcut
  def initialize(command, target)
    @command = command
    @target = target
  end

  def invoke
    puts 'by Shortcut'
    @command.call(@target)
  end
end
save_lamda = ->(target) { puts "I will save to #{target}" }
save_shortcut2 = Shortcut.new(save_lamda, 'that file')
save_shortcut2.invoke
