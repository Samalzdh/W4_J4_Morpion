require 'bundler'
Bundler.require

require_relative 'lib/app/board'
require_relative 'lib/app/board_case'
require_relative 'lib/app/game'
require_relative 'lib/app/player'

game = Game.new
game.go    