#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
JAVA_HOME=/usr/lib/jvm/java-8-oracle
/usr/lib/opentsdb/build/tsdb tsd --config /etc/opentsdb.conf
