#!/bin/bash
# Description: Automated Grafana Dashboard Provisioning

echo "Adding Grafana Repository..."
cat << 'REPO' > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://rpm.grafana.com
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://rpm.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
REPO

echo "Installing Grafana..."
dnf install -y grafana

echo "Configuring Prometheus Datasource..."
mkdir -p /etc/grafana/provisioning/datasources/
cp grafana-datasource.yml /etc/grafana/provisioning/datasources/prometheus.yml

echo "Starting and Enabling Grafana Service..."
systemctl daemon-reload
systemctl enable --now grafana-server

echo "Grafana Setup Completed! Running on port 3000."
