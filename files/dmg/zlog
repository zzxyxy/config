#!/usr/bin/env python
import psycopg2
import sys

database = ''

if "test" in sys.argv[0]:
    database = 'test'
else:
    database = 'live'

log = ' '.join(sys.argv[1:])

conn = psycopg2.connect(database=database,
                        host="localhost",
                        user="script",
                        password="script",
                        port="5432")

cursor = conn.cursor()
cursor.execute(f"INSERT INTO log (value) VALUES ('{log}')")
conn.commit()
cursor.close()
