require 'rubygems'
require 'nokogiri'
require 'open-uri'


def wiki_first_link(page_url)
	page = Nokogiri::HTML(open(page_url))

	#On retire du document le bandeau, l'infobox latérale(plusieurs formats possibles selon les pages), 
	#les schémas éventuels et les pages d'homonymie
	page.css('div.bandeau-article').remove
	page.css('table').remove
	page.css('.infobox_v3').remove
	page.css('div.thumb').remove
	page.css('.homonymie').remove


	premier_lien_rel = page.xpath('//div[@class = "mw-parser-output"]//a').first['href']
	premier_lien = "https://fr.wikipedia.org" + premier_lien_rel

end

#puts wiki_first_link("https://fr.wikipedia.org/wiki/%C3%93scar_Wirth")

def wiki_road
	#On commence par extraire une url aléatoire et la stocker dans une variable pour éviter 
	# plusieurs appels au serveur Wikipedia qui renverraient des urls différentes
	url_depart = open("https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard").base_uri
	puts "L'url de départ est : #{url_depart}"

	#page = Nokogiri::HTML(open(url_aleatoire))

	puts wiki_first_link(url_depart)

	#liste_articles = [url_depart]

end

wiki_road