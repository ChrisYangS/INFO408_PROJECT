import config
import psycopg2
from sqlalchemy import create_engine
from sqlalchemy.engine import URL


def connect_database():
    try:
        url = URL.create(
            drivername="postgresql",
            username=config.username,
            password=config.password,
            host="isdb.uod.otago.ac.nz",
            database="info408",
        )
        # Create an engine instance
        alchemyEngine = create_engine(url)
        # Connect to PostgreSQL server
        conn = alchemyEngine.connect()
        return conn
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
