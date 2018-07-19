require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'


class GetEmails

  def initialize
    super_emails = []
    super_name_town_and_number = []
    @super_array = []
    @array_of_departements = ["hautes-alpes", "vaucluse", "loire-atlantique"] # Choix des 3 départements
  end

  def launch_the_departements # Pour lancer le programme pour les 3 départements choisis au-dessus
    @array_of_departements.each do |k|
      get_the_emails(k)
    end
    create_json_file
  end

  def get_the_emails(departement) # Récupérer les emails des départements
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{departement}")) # Url des départements
    links_department = doc.css('//a[@class="lientxt"]/@href')
    links_department.each do |one_link|
      doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/#{one_link}")) # url des villes
      super_name_town_and_number = doc.css('//body > div > main > section.text-center.well.well-sm > div > div > div > h1').text
      super_emails = doc.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      @super_array << (super_name_town_and_number.split(" - ") << super_emails.to_s)
    end
    p @super_array
  end

  def create_json_file # créer un fichier json
    File.open("./db/data_towns.json", "w") do |f|
      f.write(@super_array.to_json)
    end
  end

end

#GetEmails.new.launch_the_departements
