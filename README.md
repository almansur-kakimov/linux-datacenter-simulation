# Project Ironclad: Linux Data Center Node Simulation
**Author:** Almansur Kakimov  
**Role:** Aspiring Data Center Technician (Google Inzai)

## Project Overview
This project simulates the provisioning, hardening, and automated monitoring of a Linux-based production server ("inzai-node-01"). The goal was to replicate the operational lifecycle of a data center node, focusing on reliability, resource management, and automated telemetry.

## Tech Stack & Skills Demonstrated
* **OS:** Ubuntu Server 22.04 LTS (ARM64 via UTM Virtualization)
* **Services:** Nginx Web Server (HTTP)
* **Security:** User Access Control (Sudo), UFW Firewall Configuration
* **Automation:** Bash Scripting, Crontab scheduling
* **Troubleshooting:** Resource stress testing (CPU/Disk), Log Analysis

## Key Features

### 1. Automated Health Monitoring
A custom Bash script (`health_check.sh`) runs every 5 minutes via Cron to monitor:
* **Service Availability:** Checks if Nginx is active.
* **Storage Health:** Alerts if disk usage exceeds 80%.
* **Logging:** Appends all checks to `server_health.log` for historical audit.

### 2. Failure Simulation (Chaos Engineering)
To ensure system resilience, I intentionally induced failures:
* **Thermal Event:** Used `stress` to peg CPU at 100% to analyze thermal throttling and load averages.
* **Disk Saturation:** Used `dd` to fill storage capacity to test alert thresholds.

## Installation & Setup

### 1. Provision Node
Install **Ubuntu Server 22.04 LTS**.


### 2. Install Dependencies

```bash
sudo apt install nginx stress ufw
```
### 3. Deploy Script
Copy the monitoring script to the user home directory:
```bash
cp health_check.sh /home/user/
```

### 4. Set Permissions
```bash
chmod +x health_check.sh
```

### 5. Configure Cron
Edit the crontab:
```bash
crontab -e
```

Add the following line to run the script every 5 minutes:
```bash
*/5 * * * * ~/health_check.sh
```


## Blockquotes

>This project was built as part of my preparation for the Google Data Center Technician Internship.