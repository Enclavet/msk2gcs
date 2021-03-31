#!/bin/sh

curl -i -X PUT -H  "Content-Type:application/json" \
    http://kafka-connect:8083/connectors/gcs_sink/config \
    -d '{
            "connector.class": "io.confluent.connect.gcs.GcsSinkConnector",
            "tasks.max": "1",
            "topics": "<TOPIC NAME>",
            "gcs.bucket.name": "<GCS BUCKET>",
            "gcs.part.size": "5242880",
            "flush.size": "1",
	    "gcs.credentials.path": "/kafka-connect/scripts/gcs.credentials.json",
            "storage.class": "io.confluent.connect.gcs.storage.GcsStorage",
            "format.class": "io.confluent.connect.gcs.format.avro.AvroFormat",
            "partitioner.class": "io.confluent.connect.storage.partitioner.DefaultPartitioner",
            "schema.compatibility": "NONE",
            "confluent.topic.bootstrap.servers": "<MSK BOOTSTRAP SERVERS>",
            "confluent.topic.replication.factor": "1"
        }'
