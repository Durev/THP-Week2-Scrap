require 'rubygems'
require 'nokogiri'
require 'open-uri'


def wiki_first_link(page_url)
	page = Nokogiri::HTML(open(page_url))

	#On retire du document le bandeau et l'infobox latérale
	page.css('div.bandeau-article').remove
	page.css('table').remove
	premier_lien = page.xpath('//div[@class = "mw-parser-output"]//a').first['href']
	puts premier_lien

end

wiki_first_link("https://fr.wikipedia.org/wiki/Col_de_Restefond")