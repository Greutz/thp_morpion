require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib/app', __FILE__)
require 'player'
require 'game'
require 'board'
require 'board_case'


puts "\n\tBienvenue au meilleur morpion de la GALAXIE"

Game.new.perform

