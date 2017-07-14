require 'rubygems'
require 'nokogiri'
require 'open-uri' 

def get_price
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	#On récupère l'attribut alt des logos plutôt que le texte du titre pour éviter les noms incomplets avec des ... à la fin
	monnaies = page.css("tr td.currency-name img")
	monnaies.each {|cc| puts cc['alt']}

end

get_price