from elasticsearch import Elasticsearch
es = Elasticsearch()

with open('data.txt', 'r') as f:
    for line in f:
        res = es.index(index="verbs", body={'text': line.strip()})

res = es.search(index="verbs", body={"query": {"match_all": {}}})
print("Got %d Hits:" % res['hits']['total']['value'])
for hit in res['hits']['hits']:
    print("%(text)s" % hit["_source"])
