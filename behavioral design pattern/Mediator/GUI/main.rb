class Dialog
  attr_reader :button, :text_box

  def initialize(button, text_box)
    button.mediator = self
    text_box.mediator = self
    @button = button
    @text_box = text_box
  end

  def notify(sender, event)
    send(event, sender)
  end

  def validate(_sender)
    if text_box.text.nil?
      button.enabled(false)
      puts '!!!!!!!!!!!!invalid!!!!!!!!!!!'
    else
      button.enabled(true)
    end
  end

  def enabled(_sender)
    button.enabled(true)
  end
end

class Component
  attr_accessor :mediator
end

class Button < Component
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def on_click
    puts "Button #{text} has clicked"
    mediator.notify(self, :validate)
  end

  def enabled(is_enabled)
    puts "Button #{text} enabled : #{is_enabled}"
  end
end

class TextBox < Component
  attr_reader :text

  def text=(text)
    @text = text
    on_change
  end

  def on_change
    puts "TextBox has changed to #{text}"
    mediator.notify(self, :enabled)
  end
end

but = Button.new('save')
text = TextBox.new

dig = Dialog.new(but, text)
but.on_click
text.text = 'hi'
