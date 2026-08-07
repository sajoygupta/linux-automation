# 📧 Email Troubleshooting Guide

## Commands Checklist

```bash
# Check RBL Status
host 4.3.2.1.zen.spamhaus.org

# Test Outbound SMTP Port
nc -zv smtp.sendgrid.net 587

# Live Log Stream
tail -f /var/log/exim_mainlog

# Search Archived Logs
zgrep "domain.com" /var/log/exim_mainlog* | grep "<=" | head -n 30

# Exim Queue
exim -bpc
exim -bp
exim -qff
exiqgrep -z -i | xargs exim -Mrm

# Restart Exim
systemctl restart exim
/scripts/restartsrv_exim
```
