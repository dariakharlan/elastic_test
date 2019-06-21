#!/usr/bin/env bash

curl -X PUT "localhost:9200/verbs" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "number_of_shards": 1,
        "analysis": {
            "filter": {
                "autocomplete_filter": {
                    "type":     "edge_ngram",
                    "min_gram": 2,
                    "max_gram": 10
                }
            },
            "analyzer": {
                "autocomplete": {
                    "type":      "custom",
                    "tokenizer": "standard",
                    "filter": [
                        "lowercase",
                        "autocomplete_filter"
                    ]
                }
            }
        }
    }
}'


curl -X PUT "localhost:9200/verbs/_mapping" -H 'Content-Type: application/json' -d'
{
    "properties": {
        "text": {
            "type":     "text",
            "analyzer": "autocomplete"
        }
    }
}
'


curl -X GET "localhost:9200/verbs/_search" -H 'Content-Type: application/json' -d'
{
    "query": {
        "match": {
            "text": "act"
        }
    }
}
'

curl -X GET "localhost:9200/verbs/_search" -H 'Content-Type: application/json' -d'{"query": {"match": {"text": "adress"}}}'