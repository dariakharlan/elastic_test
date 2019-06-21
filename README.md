1. Run elastic

```
docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.1.1
```

2. Build index
```
./build_index.sh
```

3. Put data
```
python put_data.py
```

Results:

```
curl -X GET "localhost:9200/verbs/_search" -H 'Content-Type: application/json' -d'{"query": {"match": {"text": "adress"}}}'
```

```json
{
  "took": 18,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 8,
      "relation": "eq"
    },
    "max_score": 7.087986,
    "hits": [
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "GdxVe2sBOwlEVFEXBRcQ",
        "_score": 7.087986,
        "_source": {
          "text": "adapt"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "GtxVe2sBOwlEVFEXBRcX",
        "_score": 7.087986,
        "_source": {
          "text": "add"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "G9xVe2sBOwlEVFEXBRcf",
        "_score": 7.087986,
        "_source": {
          "text": "address"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "HNxVe2sBOwlEVFEXBRcm",
        "_score": 7.087986,
        "_source": {
          "text": "administer"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "HdxVe2sBOwlEVFEXBRcu",
        "_score": 7.087986,
        "_source": {
          "text": "admire"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "HtxVe2sBOwlEVFEXBRc0",
        "_score": 7.087986,
        "_source": {
          "text": "admit"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "H9xVe2sBOwlEVFEXBRc8",
        "_score": 7.087986,
        "_source": {
          "text": "adopt"
        }
      },
      {
        "_index": "verbs",
        "_type": "_doc",
        "_id": "INxVe2sBOwlEVFEXBRdD",
        "_score": 7.087986,
        "_source": {
          "text": "advise"
        }
      }
    ]
  }
}
```