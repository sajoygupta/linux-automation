# 📧 Complete Email Server Troubleshooting & Relay Setup Guide

## 1. Overview & Problem Statement
* **Issue:** High mail queue, delivery failures, or IP blacklisting (e.g., Spamhaus RBL) caused by compromised cPanel accounts or improper outbound routing.
* **Objective:** Audit mail logs, clear spammed queues, route outbound traffic safely via SmartHost (SendGrid), and request RBL delisting.

---

## 2. Diagnostics & Blacklist Check
* **Check RBL Status (DNS lookup):**
  ```bash
  host 4.3.2.1.zen.spamhaus.org
nc -zv smtp.sendgrid.net 587
tail -f /var/log/exim_mainlog
zgrep "domain.com" /var/log/exim_mainlog* | grep "<=" | head -n 30
exim -bpc
exim -bp
exim -qff
exiqgrep -z -i | xargs exim -Mrm
systemctl restart exim
/scripts/restartsrv_exim
