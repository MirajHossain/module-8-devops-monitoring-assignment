#!/bin/bash

apt update -y
apt install -y docker.io docker-compose

systemctl start docker
systemctl enable docker

mkdir -p /home/ubuntu/monitoring
cd /home/ubuntu/monitoring

cat <<EOF > docker-compose.yml
version: "3"

services:
  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"

  loki:
    image: grafana/loki:2.9.0
    ports:
      - "3100:3100"

  promtail:
    image: grafana/promtail
    volumes:
      - /var/log:/var/log

  node-exporter:
    image: prom/node-exporter
    ports:
      - "9100:9100"
EOF

docker-compose up -d