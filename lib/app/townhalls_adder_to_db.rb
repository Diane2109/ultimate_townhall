# Programme 1 du bot Twitter 

# Ce programme repasse sur chaque élément du JSON et ajoute une colonne supplémentaire avec le handle twitter
# (via une recherche avec mairie [NOM_COMMUNE] en prenant le premier résultat)

require 'json'
require 'twitter'
require 'dotenv'
Dotenv.load

class TwitterToJson
	
	attr_accessor :array_towns

	def initialize
		@array_towns = []

		@client = Twitter::REST::Client.new do |config|
		  	config.consumer_key        = ENV["TWITTER_API_KEY"]
		  	config.consumer_secret     = ENV["TWITTER_API_SECRET"]
		  	config.access_token        = ENV["TWITTER_TOKEN"]
		  	config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
		end
 	end

# 1- Méthode qui cherche l'id du compte twitter à partir d'un string, par exemple le nom de la ville			
	def search_town_tweet_id(town_name)		  			
		tab = @client.user_search(town_name)
	 	if tab != []
	 	  ville = tab[0]
	 	  id_ville = ville.id	
	 	end
	end


# 2- Méthode qui rajoute le twitter user id dans le fichier Json
	def user_id_to_hash						
		towns_json_file = File.read('./db/data_towns.json')			# On ouvre le fichier Json	
		@array_towns = JSON.parse(towns_json_file)		# On parse le fichier Json. Cela crée un array du type { 01 => [ville_01, code postal_01, email_01]}

		@array_towns.each  {|v| 						# Pour chaque array [ville, code postal, email] : 
			town_name = v[0]							# on cherche le user id de la ville grace à la méthode search_town_tweet_id définie précédemment
			id_ville = search_town_tweet_id(town_name)
	 		if id_ville != nil							# Si le compte twitter n'est pas vide, on ajoute le user id de la ville dans l'array de la ville
				v << id_ville	
			end							
			}

		File.open('./db/data_towns.json', "w") do |f|                # On remet le nouvel array dans le fichier Json
			f.write(@array_towns.to_json)
		end

	end

 end





