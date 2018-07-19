# Programme 2 du bot Twitter 
# Ce programme prend la colonne des handle Twitter, 
# et qui follow les users concernés avec le compte I_Learn_Code_I_exist (@thp_2018)

require 'json'
require 'twitter'
require 'dotenv'
Dotenv.load

class TwitterFollw
	attr_accessor :id_twit

	def initialize
		@client = Twitter::REST::Client.new do |config| #pour effectuer des actions sur mon compte
			config.consumer_key        = ENV["TWITTER_API_KEY"]
			  	config.consumer_secret     = ENV["TWITTER_API_SECRET"]
			  	config.access_token        = ENV["TWITTER_TOKEN"]
			  	config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
		end
	end


	def user_id_to_follw(json_file)                     # Méthode qui rajoute le twitter user id dans le fichier Json
	    towns_json_file = File.read(json_file)          # On ouvre le fichier Json    
	    towns_json_hash = JSON.parse(towns_json_file)   # On parse le fichier Json. Cela crée un array du type { 01 => [ville_01, code postal_01, email_01]}

	    	limite_tweet = 0
	    	while limite_tweet < 30
		    	towns_json_hash.each { |k|                  # Pour chaque array [ville, code postal, email, twitter_id] on cherche le twitter_id 
		            if k.size > 3
		              id_twit = k[3]
		              begin
		                @client.follow(id_twit) 
		          	  	rescue Exception, NotFound, Forbidden, TooManyRequests
		          	  	next
		          	end
		        end                            			
		        }
		    end
	end

end

#Pour lancer le programme écrire : TwitterFollw.new.user_id_to_follw("fichier.json")
