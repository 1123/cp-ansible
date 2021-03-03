#!/bin/bash

docker run \
  -p 39013:39013 \
  -p 39017:39017 \
  -p 39041-39045:39041-39045 \
  -p 1128-1129:1128-1129 \
  -p 59013-59014:59013-59014 \
  --ulimit nofile=1048576:1048576 \
  --sysctl kernel.shmmax=1073741824 \
  --sysctl net.ipv4.ip_local_port_range='40000 60999' \
  --sysctl kernel.shmmni=524288 \
  --sysctl kernel.shmall=8388608 \
  --name hana-express-test store/saplabs/hanaexpress:2.00.040.00.20190729.1 \
  --master-password Sap-hana-s3cret \
  --agree-to-sap-license
