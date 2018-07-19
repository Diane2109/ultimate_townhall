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
require './lib/views/index'
require './lib/views/done'

class App
  def initialize
  	puts "Bienvenue sur notre application Scrapper - Emailer - Twitter de mairies"
  	puts "      -   Super THP  -  "
  	puts " "
  	puts " "

  end

  def action
  	#   puts "----------- MENU ----------------"
	  # puts "Tape 1 pour scrapper les mairies"
	  # puts "Tape 2 pour leurs envoyer des emails"
	  # puts "Tape 3 pour les follow sur tweeter"
	  # puts "Tape 4 pour sortir de l'app"
	  # puts "---------------------------------"
	  # print "Votre choix : "
		Jindex.new.affichage

	  @reponse = gets.chomp.to_i

	 # while @reponse != 4  	
	    if @reponse == 1
	      getemails = GetEmails.new.launch_the_departements
	      action
	    

	    elsif @reponse == 2
	    	require './lib/app/townhalls_mailer'
	      	@sendmails = SendMails.new
	      	action

	    elsif @reponse == 3
	    	puts " "
	    	puts "Pour chaque mairie nous allons ajouter les id des comptes twitter à la liste './db/data_towns.json'"
	    	puts " Sois patient ... "
	    	TwitterToJson.new.user_id_to_hash
	    	puts "Les id des comptes twitter ont été ajoutés à la liste './db/data_towns.json' "
	    	sleep 1

	    	puts "Ajout des comptes twitter en cours sur le compte I_Learn_Code_I_exist (@thp_2018)"
	    	TwitterFollw.new.user_id_to_follw('./db/data_towns.json')
	    	puts "Les comptes sont maintenant bien suivis"
	    	action
	    #end
		#action

	    elsif @reponse == 4
	    	Jexit.new.sortie
	    	exit
		#end 
		end
 	end
end

App.new.action