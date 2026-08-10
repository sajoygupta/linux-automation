#!/bin/bash
# Description: Automated MariaDB Replication User Creation

DB_USER="repl_user"
DB_PASS="SecureReplPassword123!"

echo "Setting up MariaDB replication user..."

# Create user and grant replication permissions
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT REPLICATION SLAVE ON *.* TO '$DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "----------------------------------------"
echo "Current Master Log Position Status:"
echo "----------------------------------------"
mysql -e "SHOW MASTER STATUS\G"

echo "Replication User Setup Completed Successfully!"
