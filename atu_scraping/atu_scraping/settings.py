# -*- coding: utf-8 -*-

# Scrapy settings for atu_scraping project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'atu_scraping'

SPIDER_MODULES = ['atu_scraping.spiders']

DATABASE = {
	'drivername': 'postgres',
	'host': 'localhost',
	'port': '5432',
	'database': 'test_um_pick_3'
}

ITEM_PIPELINES = ['atu_scraping.pipelines.CatalogPipeline']