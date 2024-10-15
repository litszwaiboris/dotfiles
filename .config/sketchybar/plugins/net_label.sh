ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'
