# Scrapp! Mail! Follow!

Bonjour, nous sommes l'équipe parisienne des Sixters @Diane @Asmahane @Garance @Perrine F @Clyde...
Et comme toi, nous avons -hier- décroché **un contrat à 300k€** pour une startup qui s'appelle The Hacking Project, la mission nous a été présentée comme suit: 
"Veuillez envoyer un email à toutes les mairies de trois départements de votre choix et de leur dire qu'ils devraient monter un groupe THP dans leur commune". 
Finaliser ce projet a nécessité plusieurs étapes de programmation, soit : la récupérations des coordonnées des mairies de 3 départements, l'envoie des mails à ces derniers, et le suivi des sur Twitter des représentants de chacunes des communes visées.


Veuillez télécharger le dossier, 
vous positionner à la racine avec votre terminal, 
lancer un bundle install 
et profitez des joies de notre programme 
en lançant la commande 
$ ruby app.rb



## Arborescence du repository ultimate_townhall, et description des programmes

'''
ultimate_townhall
├── .gitignore
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.csv
└── lib
    ├── app
    │   ├── townhalls_scrapper.rb
    │   ├── townhalls_mailer.rb
    │   ├── townhalls_adder_to_db.rb
    │   └── townhalls_follower.rb
    └── views
        ├── done.rb
        └── index.rb
'''

##### .gitignore
Ce dossier comprends les fichiers dotenv dont seule la liste (sans détail) vous est accessible.
Ces fichiers ont été créés en locale en vue de stocker nos clés d'Apis pour chacune des applications utilisées (Gmails, Twitter etc.).

#### Gemfile
Ce fichier recence tous les Gem qui ont été utilisés pour mener à bien la mission:
ruby gem 2.5.1, nokogiri, open-uri, json, dotenv, gmail, twitter.

#### **LE DOSSIER LIB**
####*Comprend le dossier App qui inclut chacun des programmes:*
**Le programme townhalls_scrapper.rb**
Permet la création d'un tableau (array) reprenant le nom des villes, leur code postal et leur contact mail à partir de la page http://annuaire-des-mairies.com/. Ces données sont enfin enregistrées sur un fichier .json.
Les Gems utilisés : 'rubygems'/'nokogiri'/'open-uri'/'json' 

**Le programme townhalls_mailer.rb**
Ce programme permet de récupérer les emails des mairie stockées sur le fichier .json (cf townhalls_scrapper.rb). Puis à travers l'applicatif Gmail, envoie un texte de présentations de THP aux mairies. 
Les Gems utilisés : 'json'/'gmail'/ 'dotenv'

**Le programme townhalls_adder_to_db.rb**
A travers une recherche réalisée via l'applicatif Twitter, ce programme incrémente les identifiants des comptes des représentants des communes au sein du fichier .Json créé précedemment.  
Les Gems utilisés : 'json'/'twitter'/ 'dotenv'

**Le programme townhalls_follower.rb**
Ce programme permet de récupérer les identifiants précèdemment stockés sur le fichier .json (cf townhalls_scrapper.rb). Puis à travers l'applicatif Twitter, envoie une commande permettant de follow chacun de ces ID. 
Les Gems utilisés : 'json'/'twitter'/ 'dotenv'

####*Comprend le dossier Views qui inclut les programmes done et index:*
**Le programme done**
Ce programme se lance lorsque vous souhaitez sortir du programme en tapant 4 et vous souhaitera une agréable journée.

**Le programme index**
Ce programme lance le sommaire de notre programme, vous pourrez voir les différents choix qui s'offrent à vous.

## Comment se servir du programme, et quelles sont les gems utilisées
Pour se servir du programme il suffit, comme-dit précédemment lancez un bundle install et lancez simplement dans votre terminal le fichier app.rb, les gems utilisées sont listées dans le fichier Gemfile.

## Ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé

Nous avons envoyé l'email suivant : 
*"Bonjour,
Je m'appelle Gérard, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique.
La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{array_second[0]} veut changer le monde avec nous ?
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"*

**Le nombre de mairies touchées :** 548 emails ont été envoyés 

**Nom du handle twitter utilisé :** I_Learn_Code_I_exist@thp_2018