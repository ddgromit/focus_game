class Game
  attr_accessor :multiplier, :score, :last_on_topic

  MULTIPLIER_INTERVAL_SECS = 10
  MAX_MULTIPLIER = 6

  def initialize
    @score = 0
    @multiplier = 1
    @last_on_topic = Time.now
  end

  def update(app)
    activity = Activity.new app

    if !activity.on_topic?
      reset
    else
      new_multiplier = (((Time.now - last_on_topic) / MULTIPLIER_INTERVAL_SECS) + 1).floor
      self.multiplier = [new_multiplier, MAX_MULTIPLIER].min
      @score = score + multiplier
    end
  end

  def reset
    puts 'reset'
    self.multiplier = 1
    last_on_topic = Time.now
  end

  def multiplier=(new_val)
    if new_val > @multiplier
      TerminalNotifier.notify("Multiplier increased to #{new_val}x", :title => "#{new_val}x Multiplier")
    elsif new_val < @multiplier
      TerminalNotifier.notify("You lost your multiplier of #{new_val}x", :title => 'Multiplier Broken')
    end

    @multiplier = new_val
  end

end