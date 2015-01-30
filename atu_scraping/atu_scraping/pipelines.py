from sqlalchemy.orm import sessionmaker
from models import Catalog, db_connect, create_catalog_table

class CatalogPipeline(object):
    """Livingsocial pipeline for storing scraped items in the database"""
    def __init__(self):
        """
        Initializes database connection and sessionmaker.
        Creates deals table.
        """
        engine = db_connect()
        create_catalog_table(engine)
        self.Session = sessionmaker(bind=engine)

    def process_item(self, item, spider):
        """Save deals in the database.

        This method is called for every item pipeline component.

        """
        session = self.Session()
        song = Catalog(**item)

        try:
            session.add(song)
            session.commit()
        except:
            session.rollback()
            raise
        finally:
            session.close()

        return item
