require 'gmail'
require 'json'
require 'dotenv'


class SendMails

  def initialize # Se connecte à l'API de gmail grâce aux id de .env
    @data_array = []
  end

#'./db/townhalls_scrapper'

  def read_emails # Lit le fichier json pour récupérer les noms des mairies et des communes
    file = File.read('./db/data_towns.json')
    @data_array = JSON.parse(file)
  end


  def send_emails # Envoie les emails à la liste du fichier json
    gmail = Gmail.connect("votre_compte_gmail", "votre_password_gmail")
    puts " "
    puts "Nous vérifions la connexion à gmail"
    puts gmail.logged_in?
    puts " "
    puts "Nous sommes en train d'envoyer des emails à la liste de mairies de 'data_towns.json' ..."
    read_emails
    @data_array.each do |array_second|
      gmail.deliver do
        to "#{array_second[2]}"
        subject "Découvrez THP !! Formation au code gratuite :D "
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<p>Bonjour,</p>
          <p>Je m'appelle Gérard, je suis élève à <em>The Hacking Project</em>, une formation au code <strong>gratuite</strong>, sans locaux, sans sélection, sans restriction géographique. </br>
          La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.</p>

          <p>Déjà 500 personnes sont passées par <strong>The Hacking Project</strong>. Est-ce que la mairie de #{array_second[0]} veut changer le monde avec nous ?</p>


          <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
        end
      end
    end
    puts " "
    puts "Les emails ont bien été envoyés! "
    gmail.logout
  end

end



SendMails.new.send_emails
