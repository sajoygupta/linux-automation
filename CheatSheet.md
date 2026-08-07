# 🛠️ Exim Mail Server & RBL Troubleshooting Cheat Sheet

### 1. Check IP Blacklist (RBL Status)
# Reverse the IP (e.g., 1.2.3.4 -> 4.3.2.1) and check via DNS
host 4.3.2.1.zen.spamhaus.org

### 2. Test SMTP Relay / Outbound Connection
nc -zv smtp.sendgrid.net 587

### 3. Exim Service Management & Queue Operations
systemctl restart exim       # Restart Exim service
/scripts/restartsrv_exim    # Restart via cPanel script
exim -qff                  # Force flush/deliver all queued emails

### 4. Archived Exim Log Analysis
zgrep "domain.com" /var/log/exim_mainlog* | grep "<=" | head -n 30
