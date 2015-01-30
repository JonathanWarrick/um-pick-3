from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.engine.url import URL

import settings

DeclarativeBase = declarative_base()

def db_connect():
    """
    Performs database connection using database settings from settings.py.
    Returns sqlalchemy engine instance
    """
    return create_engine(URL(**settings.DATABASE))

def create_catalog_table(engine):
    """"""
    DeclarativeBase.metadata.create_all(engine)


class Catalog(DeclarativeBase):
    """Sqlalchemy catalog model"""
    __tablename__ = "catalog"

    id = Column(Integer, primary_key=True)
    song_name = Column('song_name', String)
    song_artist = Column('song_artist', String, nullable=True)
    times_played = Column('times_played', Integer, nullable=True)
    debut_date = Column('debut_date', DateTime, nullable=True)
    last_played_date = Column('last_played_date', DateTime, nullable=True)