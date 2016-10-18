#!/usr/bin/python

from elasticsearch import Elasticsearch
import MySQLdb.cursors
from datetime import datetime
import json
import os

#Credentials ElasticSearch
esHost = os.environ['ELASTICSEARCH_PORT_9200_TCP_ADDR']

#Credentials MySql
mysqlHost = os.environ['MYSQL_PORT_3306_TCP_ADDR']
mysqlUser = '' 
mysqlPasswd = ''

#Database Config ES|MySql
esIndex = '', 
esDocType = ''
mysqlDb = ''

#Queries
queryData = '';
queryProdutcts = '';

#Connection MySql
db = MySQLdb.connect(
    host=mysqlHost,
    user=mysqlUser,
    passwd=mysqlPasswd,
    db=mysqlDb,
    cursorclass=MySQLdb.cursors.DictCursor
)  

cur = db.cursor()
cur.execute(queryUser)

#Connection ElasticSearch
es = Elasticsearch([esHost])

#Create Json with querie's Sata 
userProduts = []
for data in cur.fetchall():
    cur.execute(queryProdutcts + str(data['id']))

    for produtct in cur.fetchall():
        userProduts.append(produtct);
    
    data['produto'] = userProduts
    userProduts = []

    #Insert into ElasticSearch
    res = es.index(index=esIndex, doc_type=esDocType, body=json.dumps(data))
    print(res['created'])

db.close()
