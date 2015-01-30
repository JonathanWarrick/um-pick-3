# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

from scrapy.item import Item, Field


class ATUScrapingItem(Item):
  # UM catalog
  song_name = Field()
  song_artist = Field()
  times_played = Field()
  debut_date = Field()
  last_played_date = Field()

  # UM show
  # show_date = Field()
  # venue = Field()
  # city = Field()
  # state = Field()
  # country = Field()
  # song_played = Field()
