#!/usr/bin/env python
import psycopg2
import sys
import argparse

database = ''

if "test" in sys.argv[0]:
    database = 'test'
else:
    database = 'live'


def dbconn():
    return psycopg2.connect(database=database,
                            host="localhost",
                            user="script",
                            password="script",
                            port="5432")




def start(topic):
    conn = dbconn()
    cursor = conn.cursor()
    cursor.execute(f"INSERT INTO ongoing (status, value) VALUES ('ongoing', '{topic}')")
    conn.commit()
    cursor.close()

    print(f'Then start working on : {topic}')


def list():
    conn = dbconn()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM ongoing ORDER BY id DESC LIMIT 100 ")
    res = cursor.fetchall()

    for item in res:
        print(f'{item[0]:>6} {item[4]:<50} {item[3]:>7} {item[1]} {item[2]}')

    conn.close()


def stop(id):
    conn = dbconn()
    cursor = conn.cursor()
    cursor.execute(f"UPDATE ongoing SET closed_on=current_timestamp, status='finished' WHERE id={id} AND status='ongoing'")
    conn.commit()
    cursor.close()



def main():
    parser = argparse.ArgumentParser(prog='zongoing', description='Shssss secret')
    commandparser = parser.add_subparsers(help = 'command')

    startparser = commandparser.add_parser('start', help = "start working on topic")
    startparser.add_argument('-t', '--topic', required=True, help='Name of the topic to work on')
    startparser.set_defaults(action=lambda: start(args.topic))

    listparser = commandparser.add_parser('list', help='list tasks')
    listparser.set_defaults(action=lambda: list())

    stopparser = commandparser.add_parser('stop', help = "close a topic by id")
    stopparser.add_argument('-t', '--topicId', required=True, help='Id of the topic to close')
    stopparser.set_defaults(action=lambda: stop(args.topicId))

    args = parser.parse_args()
    args.action()

if __name__ == "__main__":
    main()
