# 📧 Email Server Troubleshooting & Relay Setup Guide

### Summary
* **Issue:** Mail delivery failures / Blacklist issues due to outbound spam or configuration.
* **Resolution:** Exim log analysis, SMTP connection tests, SmartHost relay setup, and queue management.

### Key Commands & Workflows
* **Check Exim Queue:** `exim -bpc`
* **Flush Queue:** `exim -qff`
* **Log Inspection:** `tail -f /var/log/exim_mainlog`
