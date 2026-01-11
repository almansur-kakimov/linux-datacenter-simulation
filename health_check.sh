{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww34020\viewh21340\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #!/bin/bash\
LOG_FILE="/home/technician/server_health.log"\
DATE=$(date '+%Y-%m-%d %H:%M:%S')\
\
echo "[$DATE] Check Start >> $LOG_FILE\
\
# Check Nginx\
if systemctl is-active --quiet nginx; then\
    echo "[$DATE] [PASS] Nginx Active" >> $LOG_FILE\
else\
    echo "[$DATE] [FAIL] Nginx DOWN" >> $LOG_FILE\
fi\
\
# Check Disk\
USAGE=$(df / --output=pcent | tail -1 | tr -dc '0-9')\
if [ $USAGE -gt 80 ]; then\
    echo "[$DATE] [WARNING] Disk High: $USAGE%" >> $LOG_FILE\
else\
    echo "[$DATE] [PASS] Disk OK: $USAGE%" >> $LOG_FILE\
fi}