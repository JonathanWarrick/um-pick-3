from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.contrib.loader import XPathItemLoader
from scrapy.contrib.loader.processor import Join, MapCompose

from atu_scraping.items import ATUScrapingItem

class CatalogSpider(BaseSpider):
	name = "catalog"
	allowed_domains = ["allthings.umphreys.com"]
	start_urls = ["http://allthings.umphreys.com/song/"]

	catalog_xpath = '//*[@id="songtable"]/tbody/tr'
	item_fields = {
	  'song_name': './/td[1]/a/text()',  
	  'song_artist': './/td[2]/text()',
	  'times_played': './/td[3]/text()',
	  'debut_date': './/td[4]/a/text()',
	  'last_played_date': './/td[5]/a/text()'
	}

	def parse(self, response):
          selector = HtmlXPathSelector(response)

          # iterate over songs
          for song in selector.select(self.catalog_xpath):
              loader = XPathItemLoader(ATUScrapingItem(), selector=song)

              # define processors
              loader.default_input_processor = MapCompose(unicode.strip)
              loader.default_output_processor = Join()

              # iterate over fields and add xpaths to the loader
              for field, xpath in self.item_fields.iteritems():
                  print field
                  loader.add_xpath(field, xpath)
              yield loader.load_item()