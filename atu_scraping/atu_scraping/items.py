# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class ATUScrapingItem(scrapy.Item):
  # UM catalog
  song_name = scrapy.Field()
  song_artist = scrapy.Field()
  times_played = scrapy.Field()
  debut_date = scrapy.Field()
  last_played_date = scrapy.Field()

  # UM show
  show_date = scrapy.Field()
  venue = scrapy.Field()
  city = scrapy.Field()
  state = scrapy.Field()
  country = scrapy.Field()
  song_played = scrapy.Field()
