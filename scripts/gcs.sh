#!/bin/sh

curl -i -X PUT -H  "Content-Type:application/json" \
    http://kafka-connect:8083/connectors/gcs_sink/config \
    -d '{
            "connector.class": "io.confluent.connect.gcs.GcsSinkConnector",
            "tasks.max": "1",
            "topics": "gcs_topic",
            "gcs.bucket.name": "firehoses3togcs",
            "gcs.part.size": "5242880",
            "flush.size": "1",
	    "gcs.credentials.path": "/kafka-connect/scripts/gcs.credentials.json",
            "storage.class": "io.confluent.connect.gcs.storage.GcsStorage",
            "format.class": "io.confluent.connect.gcs.format.avro.AvroFormat",
            "partitioner.class": "io.confluent.connect.storage.partitioner.DefaultPartitioner",
            "schema.compatibility": "NONE",
            "confluent.topic.bootstrap.servers": "b-1.msktogcs.53mbm9.c14.kafka.us-east-1.amazonaws.com:9092,b-2.msktogcs.53mbm9.c14.kafka.us-east-1.amazonaws.com:9092",
            "confluent.topic.replication.factor": "1"
        }'
