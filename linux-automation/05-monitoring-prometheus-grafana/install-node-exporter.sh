#!/bin/bash
# Description: Automated Prometheus Node Exporter Setup

NODE_VERSION="1.7.0"

echo "Downloading Prometheus Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_VERSION}/node_exporter-${NODE_VERSION}.linux-amd64.tar.gz

tar xvf node_exporter-${NODE_VERSION}.linux-amd64.tar.gz
cd node_exporter-${NODE_VERSION}.linux-amd64
cp node_exporter /usr/local/bin/

# Create Systemd Service
cat << 'SERVICE' > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=root
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
SERVICE

systemctl daemon-reload
systemctl enable --now node_exporter

echo "Node Exporter Installation Completed! Running on port 9100."
