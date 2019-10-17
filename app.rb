require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib/app', __FILE__)
require 'player'
require 'game'
require 'board'
require 'board_case'


puts "message de bienvenu"

new_game = Game.new.perform

