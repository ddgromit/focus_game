require 'ax_elements'
require 'terminal-notifier'
require "yaml/store"

require './lib/activity'
require './lib/game'


store = YAML::Store.new("data.yml")
initial_score = 0

store.transaction do
  initial_score = store.fetch(:score, 0)
end

game = Game.new initial_score

while true
  app = AX::Application.frontmost_app
  game.update(app)

  store.transaction do
    store[:score] = game.score
  end

  puts "Score: #{game.score}\tMultiplier: #{game.multiplier}x\t\tApp: #{app.title}"

  sleep 1
end

