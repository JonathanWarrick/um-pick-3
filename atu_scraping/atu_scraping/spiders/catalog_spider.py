import scrapy

from atu_scraping.items import ATUScrapingItem

class CatalogSpider(scrapy.Spider):
	name = "catalog"
	allowed_domains = ["allthings.umphreys.com"]
	start_urls = [
		"http://allthings.umphreys.com/song/"
	]

	# catalog_xpath = '//*[@id="songtable"]/tbody'
	# item_fields = {
	#   'song_name': './/tr/td[1]'  
	#   'song_artist': './/tr/td[2]' 
	#   'times_played': './/tr/td[3]'
	#   'debut_date': './/tr/td[4]'
	#   'last_played_date': './/tr/td[5]'
	# }

	def parse(self, response):
		for sel in response.xpath('//*[@id="songtable"]/tbody'):
			item = ATUScrapingItem()
			item['song_name'] = sel.xpath('tr/td[1]/a/text()').extract()
			item['song_artist'] = sel.xpath('tr/td[2]/text()').extract()
			item['times_played'] = sel.xpath('tr/td[3]/text()').extract()
			item['debut_date'] = sel.xpath('tr/td[4]/a/text()').extract()
			item['last_played_date'] = sel.xpath('tr/td[5]/a/text()').extract()
			yield item