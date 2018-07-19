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


class Jexit
  
  def sortie
  	  puts "--------------------------"
	  puts " "
	  puts "Merci de votre visite et à bientôt"
	  puts "Cat, Asma, Perrine, Garance, Diane, (Y)"
	  puts " "
	  puts "---------------------------------"
	  puts " "
	end

end