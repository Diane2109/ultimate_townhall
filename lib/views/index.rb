require 'bundler'
Bundler.require

require 'nokogiri'
require 'open-uri'
require 'json'
require 'dotenv'
require 'gmail'
require 'twitter'

require './lib/app/townhalls_scrapper'
require './lib/app/townhalls_adder_to_db'
require './lib/app/townhalls_follower'


class Jindex
  
  def affichage
  	  puts "----------- MENU ----------------"
	  puts "Tape 1 pour scrapper les mairies"
	  puts "Tape 2 pour leurs envoyer des emails"
	  puts "Tape 3 pour les follow sur tweeter"
	  puts "Tape 4 pour sortir de l'app"
	  puts "---------------------------------"
	  puts " "
	  print "Votre choix : "
	end

end