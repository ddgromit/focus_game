require 'ax_elements'
require 'terminal-notifier'

require './lib/activity'
require './lib/game'


game = Game.new

while true
  app = AX::Application.frontmost_app
  game.update(app)  

  puts "Score: #{game.score}\tMultiplier: #{game.multiplier}x\t\tApp: #{app.title}"

  sleep 1
end

